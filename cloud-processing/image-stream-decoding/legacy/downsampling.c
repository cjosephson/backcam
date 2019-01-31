#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

uint8_t inbuf;
uint8_t outbuf[2];

int main(int argc, char* argv[])
{
	if (argc != 2)
	{
		printf("Usage: ./downsampling <input_file>");
	}
	FILE* bindump;
	bindump = fopen(argv[1], "rb");
	if (!bindump)
	{
		exit(1);
	}
	FILE* outfile;
	outfile = fopen("output.bmp", "wb");
	if (!outfile)
	{
		exit(1);
	}
	while (fread(&inbuf, sizeof(uint8_t), 1, bindump))
	{
		outbuf[0] = inbuf & 0xF0;
        outbuf[1] = (inbuf & 0x0F) << 4;
		fwrite(outbuf, sizeof(uint8_t), 2, outfile);
	}
	fclose(bindump);
	fclose(outfile);
    system("echo 'y' | ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 164x122 -i output.bmp -f image2 -vcodec png output.png &> /dev/null");
	return 0;
}
