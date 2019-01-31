#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

uint8_t inbuf;
uint8_t outbuf;
int byteindex = 0;
uint8_t pred = 0;

int main(int argc, char* argv[])
{
	if (argc != 2)
	{
		printf("Usage: ./deltamodulation <input_file>");
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
        if (byteindex % 5 == 0)
        {
            outbuf = inbuf;
            pred = inbuf;
            fwrite(&outbuf, sizeof(uint8_t), 1, outfile);
        }
        else
        {
            for (int i = 0; i < 8; i++)
            {
                uint8_t delt = inbuf & 0x01;
                inbuf >>= 1;
                if (delt)
                {
                    if (pred < 240)
                    {
                        pred += 16;
                    }
                    else
                    {
                        pred = 255;
                    }
                }
                else
                {
                    if (pred >= 16)
                    {
                        pred -= 16;
                    }
                    else
                    {
                        pred = 0;
                    }
                }
                outbuf = pred;
		        fwrite(&outbuf, sizeof(uint8_t), 1, outfile);
            }
        }
        byteindex += 1;
	}
    fwrite(&outbuf, sizeof(uint8_t), 1, outfile);   /* we didn't tx the last pixel */
	fclose(bindump);
	fclose(outfile);
    system("echo 'y' | ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 164x122 -i output.bmp -f image2 -vcodec png output.png &> /dev/null");
	return 0;
}
