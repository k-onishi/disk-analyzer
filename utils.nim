import posix, strutils, sequtils, strformat

proc exitWithErrorMsg*(msg: string): void {.noreturn.} =
  echo msg
  posix.exitnow(1)

proc hex*(val: uint8, prefix: bool): string =
  return (if prefix: "0x" else: "") & strutils.toHex(val)
  
proc hex*(val: uint16, prefix: bool): string =
  return (if prefix: "0x" else: "") & strutils.toHex(val)

proc hex*(val: uint32, prefix: bool): string =
  return (if prefix: "0x" else: "") & strutils.toHex(val)

proc displayTableHeader*(headerStr: string) =
  echo fmt("""* {headerStr:<60}""")

proc displayTableSeperater*() =
  echo "------------------------------------------------------------"

proc displayTableRow*(title, value: string) =
  echo fmt("""| {title:<30}|{value:>25} |""")