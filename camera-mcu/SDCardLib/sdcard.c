//*****************************************************************************
//
// sdcard.c
//
//*****************************************************************************

//*****************************************************************************
//
//! \addtogroup sdcardlib_api sdcardlib
//! @{
//
//*****************************************************************************
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include "sdcard.h"
#include "diskio.h"

void SDCardLib_init(SDCardLib * lib, SDCardLib_Interface * interface)
{
    lib->interface = interface;

    f_mount(0, &lib->fatfs);

    disk_initCallBack(interface);
}

void SDCardLib_unInit(SDCardLib * lib)
{
    /* Unregister work area prior to discard it */
    f_mount(0, NULL);
}

FRESULT SDCardLib_getDirectory(SDCardLib * lib,
		                    char * directoryName, 
                            char (*dirList)[MAX_DIR_LEN], uint8_t *dirNum,
                            char (*fileList)[MAX_FILE_LEN], uint8_t *fileNum)
{
    FRESULT rc;                                            /* Result code */
    DIRS dir;                                               /* Directory object */
    FILINFO fno;                                           /* File information object */
    uint8_t dirCnt = 0;                /* track current directory count */
    uint8_t fileCnt = 0;                /* track current directory count */

    rc = f_opendir(&dir, directoryName);

    for (;;)
    {
        rc = f_readdir(&dir, &fno);                        // Read a directory item
        if (rc || !fno.fname[0]) break;                    // Error or end of dir
        if (fno.fattrib & AM_DIR)                          //this is a directory
        {
            strcat(*dirList, fno.fname);                      //add this to our list of names
            dirCnt++;
            dirList++;
        }
        else                                               //this is a file
        {
            strcat(*fileList, fno.fname);                      //add this to our list of names
            fileCnt++;
            fileList++;
        }
    }

    *dirNum = dirCnt;
    *fileNum = fileCnt;

    return rc;
}

FRESULT SDCardLib_createDirectory(SDCardLib * lib, char * directoryName)
{
	return f_mkdir(directoryName);
}

FRESULT SDCardLib_readFile(SDCardLib * lib,
		                   char * fileName, char *buffer, uint16_t bufsize,
						   uint16_t *actualsize)
{
    FRESULT rc;                                            /* Result code */
    FIL fil;                                               /* File object */
    uint16_t br;
    uint16_t toReadSize = bufsize;

    rc = f_open(&fil, fileName, FA_READ);
    if (rc) {
        goto READ_EXIT;
    }

    *actualsize = 0;
    for (;;)
    {
        rc = f_read(&fil, buffer, toReadSize, &br);        /* Read a chunk of file */
        if (rc || !br) break;                              /* Error or end of file */

        buffer += br;
        toReadSize -= br;
        *actualsize += br;
    }

READ_EXIT:
    f_close(&fil);
    
    return rc;
}

FRESULT SDCardLib_writeFile(SDCardLib * lib,
		                   char * fileName, char *buffer, uint16_t bufsize,
						   uint16_t *actualsize)
{
    // Result code
    FRESULT rc;
    // File object
    FIL fil;

    // Open file
    rc = f_open(&fil, fileName, FA_WRITE | FA_CREATE_ALWAYS);
    if (rc)
    {
        goto WRITE_EXIT;
    }

    // Write to file
    rc = f_write(&fil, buffer, bufsize, actualsize);
    if (rc || *actualsize == 0)
    {
        goto WRITE_EXIT;
    }

WRITE_EXIT:
    // Close the file
    f_close(&fil); 
    return rc;
}

SDCardLib_Status SDCardLib_detectCard(SDCardLib * lib)
{
	//Use software to detect card present
	if (lib->interface->sdDetectCard == NULL) {
		return (SDCardLib_Status)detectCard();
	}
	else {
		return (SDCardLib_Status)(lib->interface->sdDetectCard());
	}
}

void SDCardLib_setRTCTime(SDCardLib * lib, Calendar *curTime)
{
	if (lib->interface->sdSetRTCTime) {
		lib->interface->sdSetRTCTime(curTime);
	}
}
//*****************************************************************************
//
//! Close the doxygen group for sdcardlib_api
//! @}
//
//*****************************************************************************
