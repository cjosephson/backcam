//*****************************************************************************
//
// sdcard.h
//
//*****************************************************************************
#ifndef __SDCARDLIB_H__
#define __SDCARDLIB_H__

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "assert.h"
#include "ff.h"
#include "driverlib.h"

//*****************************************************************************
//
// If building with a C++ compiler, make all of the definitions in this header
// have a C binding.
//
//*****************************************************************************
#ifdef __cplusplus
extern "C"
{
#endif

//*****************************************************************************
//
// The length limit of directory name. Refer to 8.3 format file name (SFN) for
// more details. 
//
//*****************************************************************************
#define MAX_DIR_LEN   8

//*****************************************************************************
//
// The length limit of file name. Refer to 8.3 format file name (SFN) for
// more details. 
//
//*****************************************************************************
#define MAX_FILE_LEN  12

//*****************************************************************************
//
//! \brief SD Card present status. 
//
//*****************************************************************************
typedef enum SDCardLib_Status
{
	SDCARDLIB_STATUS_NOT_PRESENT = 0,
	SDCARDLIB_STATUS_PRESENT
}SDCardLib_Status;

//*****************************************************************************
//
//! \brief SD Card interface. It defines the abstract interfaces that each
//! specfic SD card device needs to implement.
//
//*****************************************************************************
typedef struct SDCardLib_Interface
{
    //! The MCLK frequency the device is running at.
	uint32_t freq;

    //! The SD Card initialization interface.
    void (*sdInit)(void);

    //! The SD Card fast mode configuration interface.
    void (*sdFastMode)(void);

    //! The SD Card reading frame interface.
    void (*sdReadFrame)(uint8_t *pBuffer, uint16_t size);

    //! The SD Card sending fram interface.
    void (*sdSendFrame)(uint8_t *pBuffer, uint16_t size);

    //! The SD Card setting chip-select high interface.
    void (*sdSetCSHigh)(void);

    //! The SD Card setting chip-select low interface.
    void (*sdSetCSLow)(void);

    //! The SD Card detecting card present interface.
    SDCardLib_Status (*sdDetectCard)(void);

    //! The SD Card setting RTC time interface.
    Calendar (*sdGetRTCTime)(void);

    //! The SD Card getting RTC time interface.
    void (*sdSetRTCTime)(Calendar *curTime);

} SDCardLib_Interface;

//*****************************************************************************
//
//! \brief SD Card library struct.
//
//*****************************************************************************
typedef struct SDCardLib
{
    //! FatFs handle for current FatFs operation session
    FATFS fatfs;

    //! Interface points to the specfic SD Card interface implementation
    SDCardLib_Interface * interface;

} SDCardLib;

//*****************************************************************************
//
//! \brief Initializes the SD Card.
//!
//! This function intializaes the SD Card on the device including mounting physical
//! driver to logical driver and pluging the interface to the SDCardLib. This
//! function should be called first before invoking other SDCardLib APIs.
//!
//! \param lib is pointer to the SDCardLib struct.
//! \param interface is the pointer to the specific SDCard_Interface
//!        implementation.
//!
//! \return None
//
//*****************************************************************************
void SDCardLib_init(SDCardLib * lib, SDCardLib_Interface * interface);

//*****************************************************************************
//
//! \brief Uninitialize the SD Card.
//!
//! This function unmounts the physical driver from the logical driver. This API
//! is usually called after all the SDCard operations are finished.
//!
//! \param lib is pointer to the SDCardLib struct.
//!
//! \return None
//
//*****************************************************************************
void SDCardLib_unInit(SDCardLib * lib);


//*****************************************************************************
//
//! \brief Gets the directories and files from the specified directory.
//!
//! This function iterates through all the directories and files under the specified
//! directory. It returns the directory/file list, and corresponding numbers of
//! them. Please note the current supported length of directory/file is compliant
//! with 8.3 format file name (SFN). To support long file name, make _USE_LFN = 2
//! or 3 and increase the MAX_DIR_LEN and MAX_FILE_LEN.
//!
//! \param lib is pointer to the SDCardLib struct.
//! \param directoryName is the directory to iterate through.
//! \param dirList is the list of found directories.
//! \param dirNum is the number of found directories.
//! \param fileList is the list of found files.
//! \param fileNum is the number of found files.
//!
//! \return The funtion return code
//
//*****************************************************************************
FRESULT SDCardLib_getDirectory(SDCardLib * lib,
		                       char * directoryName, 
                               char (*dirList)[MAX_DIR_LEN], uint8_t *dirNum,
                               char (*fileList)[MAX_FILE_LEN], uint8_t *fileNum);

//*****************************************************************************
//
//! \brief Creates the new directory.
//!
//! This function creates the new directory based on the absolute path. The sub
//! directories are separated with a \ or /.
//!
//! \param lib is pointer to the SDCardLib struct.
//! \param directoryName is the new directory to create.
//!
//! \return The funtion return code
//
//*****************************************************************************
FRESULT SDCardLib_createDirectory(SDCardLib * lib, char * directoryName);

//*****************************************************************************
//
//! \brief Reads the specified file to buffer
//!
//! This function reads the specified file to the user-allocated buffer. If user
//! cannot allocate the enough buffer to hold the contents in the file, it is
//! suggested to use f_read() and to do multiple reading operations.
//!
//! \param lib is pointer to the SDCardLib struct.
//! \param fileName is the file to read.
//! \param buffer is the reading buffer to hold contents from file.
//! \param bufsize is the size of buffer.
//! \param actualsize is the actual reading size in bytes.
//!
//! \return The funtion return code
//
//*****************************************************************************
FRESULT SDCardLib_readFile(SDCardLib * lib,
		                   char * fileName, char *buffer, uint16_t bufsize,
		                   uint16_t *actualsize);

//*****************************************************************************
//
//! \brief Writes to specified file from buffer
//!
//! This function writes to the specified from the user-allocated buffer. If user
//! cannot allocate the enough buffer for content to writing , it is suggested
//! to use f_write() and to do multiple writing operations.
//!
//! \param lib is pointer to the SDCardLib struct.
//! \param fileName is the file to read.
//! \param buffer is the buffer with contentes to be written.
//! \param bufsize is the size of buffer.
//! \param actualsize is the actual writing size in bytes.
//!
//! \return The funtion return code
//
//*****************************************************************************
FRESULT SDCardLib_writeFile(SDCardLib * lib,
		                   char * fileName, char *buffer, uint16_t bufsize,
		                   uint16_t *actualsize);

//*****************************************************************************
//
//! \brief Detects the SD Card present or not.
//!
//! This function detects whether the SD Card is inserted.
//!
//! \param lib is pointer to the SDCardLib struct.
//!
//! \return SDCARD_STATUS_NOT_PRESENT or SDCARD_STATUS_PRESENT
//
//*****************************************************************************
SDCardLib_Status SDCardLib_detectCard(SDCardLib * lib);

//*****************************************************************************
//
//! \brief Sets SD Card RTC time
//!
//! This function sets the RTC time for all the SD Card file system operation.
//! This function is usually called before invoking SD Card Library APIs.
//!
//! \param lib is pointer to the SDCardLib struct.
//! \param curTime is the pointer to the initial setting of calendar.
//!
//! \return None
//
//*****************************************************************************
void SDCardLib_setRTCTime(SDCardLib * lib, Calendar *curTime);

//*****************************************************************************
//
// Mark the end of the C bindings section for C++ compilers.
//
//*****************************************************************************
#ifdef __cplusplus
}
#endif

#endif
