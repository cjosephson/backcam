#include <stdlib.h>
#include <stdint.h>
#include <ctype.h>
#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <unistd.h>  /* UNIX standard function definitions */
#include <fcntl.h>   /* File control definitions */
#include <errno.h>   /* Error number definitions */
#include <termios.h> /* POSIX terminal control definitions */

uint8_t inbuf[2];
uint8_t outbuf[79544];
//uint8_t outbuf;
uint8_t framestart[] = {'A','A','A','A','A','A','A','A','A','A','A','A','A','A','A','A'};

int main(int argc, char** argv){
    /* cli args parse */
    int hi_res = 0;
    int help = 0;
    char *tty_path = NULL;
    int index;
    int c;
    opterr = 0;
    while ((c = getopt (argc, argv, "lht:")) != -1) {
        switch (c) {
            case 'l':
                hi_res = 1;
                break;
            case 'h':
                help = 1;
                break;
            case 't':
                tty_path = optarg;
                break;
            case '?':
                if (optopt == 't')
                    fprintf (stderr, "Option -%c requires an argument.\n", optopt);
                else if (isprint(optopt))
                    fprintf (stderr, "Unknown option `-%c'.\n", optopt);
                else
                    fprintf (stderr, "Unknown option character `\\x%x'.\n", optopt);
                exit(1);
            default:
                abort();
        }
    }

    if (help) {
        printf("usage: %s [-lh] [-t tty]\n", argv[0]);
        printf("-l\t: use high resolution (326x244)\n");
        printf("-h\t: print help message\n");
        printf("-t tty\t: set path to tty device file\n");
        exit(0);
    }

    int USB;
    if (tty_path) {
        USB = open( tty_path, O_RDWR|O_NOCTTY|O_NONBLOCK );
    }
    else {
        USB = open( "/dev/ttyUSB0", O_RDWR|O_NOCTTY|O_NONBLOCK );
    }
    printf("USB = %d\n", USB);

    if( USB==-1 ){
        printf("serial port open bad\n");
        exit(1);
    }
    else{
        printf("serial port open good\n");
    }

    if (fcntl(USB, F_SETFL, 0) == -1)
    {
        printf("can't set tty device non-blocking\n");
        exit(1);
    }

    struct termios tty;
    memset (&tty, 0, sizeof tty);

    if( tcgetattr(USB, &tty)!= 0){
        printf("Error fetching tty config, %i\n",errno);
    }
    /* Set Baud Rate */
    cfsetospeed (&tty, (speed_t)B230400);
    cfsetispeed (&tty, (speed_t)B230400);

    tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;     // 8-bit chars
    tty.c_iflag &= ~IGNBRK;         // disable break processing
    tty.c_lflag = 0;                // no signaling chars, no echo,
    // no canonical processing
    tty.c_oflag = 0;                // no remapping, no delays
    tty.c_cc[VMIN]  = 0;            // read doesn't block
    tty.c_cc[VTIME] = 100;            // 0.5 seconds read timeout

    tty.c_iflag &= ~(IXON | IXOFF | IXANY); // shut off xon/xoff ctrl

    tty.c_cflag |= (CLOCAL | CREAD);// ignore modem controls,
    // enable reading
    tty.c_cflag &= ~(PARENB | PARODD);      // shut off parity
    tty.c_cflag |= 0;
    tty.c_cflag &= ~CSTOPB;
    tty.c_cflag &= ~CRTSCTS;


    /* Flush Port, then applies attributes */
    tcflush( USB, TCIFLUSH );
    if ( tcsetattr ( USB, TCSANOW, &tty ) != 0) {
        printf("Error configuring tty, %i\n", errno);
    }

    FILE* outfile;
    int marker_state = 0;
    int intransit = 0;
    int pic_state = 0;

    /* keep reading until start of frame */
    while (1)
    {
        read(USB, inbuf, 1);
	if (inbuf[0] == 'A') {
	  marker_state += 1;
	}
	else {
	  marker_state = 0;
	}
        if (marker_state == 16) {
	  printf("Synced\n");
	  marker_state = 0;
	  intransit = 1;
	  outfile = fopen("output", "wb");
	  break;
        }
    }
    
    int i = 0;
    while (1)
    {
      
      read(USB, inbuf, sizeof(inbuf));
      if (inbuf[0] == 'A' && inbuf[1] == 'A') {
	marker_state += 2;
	printf("marker state %i\n", marker_state);
      }
      else {
	marker_state = 0;
      }
      
      outbuf[pic_state] = ((inbuf[0] & 0xF) << 4) | (inbuf[1] & 0xF);
      pic_state += 1;

      //check for frame header
      char buf[200];
      if (marker_state == 16){
	printf("Start of frame\n");
	printf("pic_state %i\n",pic_state);
	outfile = fopen("output", "wb");
	marker_state = 0;
	if (pic_state - 8 >= 79544) {
	  fwrite(&outbuf, sizeof(uint8_t), pic_state, outfile);
	  fclose(outfile);
	  pic_state = 0;
	  intransit = 0;
	  snprintf(buf, sizeof(buf), "echo 'y' | ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 326x244 -i output -f image2 -vcodec png -vf 'transpose=2,transpose=2,eq=brightness=0.7:contrast=2.5' IMG_%d.png &> /dev/null", i);
	  system(buf);
	  i++;
	  printf("Dumped\n");
	}
	else if (20008 <= pic_state - 8 && pic_state - 8 < 79000 ) {
	  fwrite(&outbuf, sizeof(uint8_t), pic_state, outfile);
	  pic_state = 0;
	  intransit = 0;
	  fclose(outfile);
	  //-fv argument rotates image 180 degrees
	  snprintf(buf, sizeof(buf), "echo 'y' | ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 164x122 -i output -f image2 -vcodec png -vf 'transpose=2,transpose=2,eq=brightness=0.7:contrast=2.5' IMG_%d.png &> /dev/null", i);
	  system(buf);
	  i++;
	  printf("Dumped\n");
	}
      }
    }
    return 0;
}
