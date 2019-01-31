#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

uint8_t inbuf[2];
uint8_t outbuf;

int main(int argc, char* argv[])
{
	if (argc != 2)
	{
		printf("Usage: ./convert <input_file>");
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
	while (fread(inbuf, sizeof(uint8_t), 2, bindump))
	{
		outbuf = ((inbuf[0] & 0xF) << 4) | (inbuf[1] & 0xF);
		fwrite(&outbuf, sizeof(uint8_t), 1, outfile);
	}
	fclose(bindump);
	fclose(outfile);
    system("echo 'y' | ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 164x122 -i output.bmp -f image2 -vcodec png output.png &> /dev/null");
	return 0;
}
