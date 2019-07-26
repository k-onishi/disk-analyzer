import os
import posix
import strutils

import lib/mbr/mbr
import lib/mbr/mbr_utils
import utils

proc main() =
  # get a file name
  if paramCount() < 1:
    exitWithErrorMsg("expect filename")
  let filename = paramStr(1)

  # open the file
  var fd: cint = open(filename, 0)
  if fd == -1:
    exitWithErrorMsg("can't open file")
  
  # read first sector
  var sectorData: sector
  let readCount: int = read(fd, sectorData.addr, SECTOR_SIZE)
  if readCount < 0:
    exitWithErrorMsg("failed to read file")

  # show information of Master Boot Record
  let mbRecord = toMasterBootRecord(sectorData)
  displayMasterBootRecord(mbRecord)

main()