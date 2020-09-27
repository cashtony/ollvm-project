; RUN: %llc_dwarf -filetype=obj < %s | llvm-dwarfdump -debug-info - | FileCheck %s
; REQUIRES: object-emission

; Generated by clang -S -c -std=c++11 --emit-llvm -g from the following C11 source:
; _Noreturn void f() {
;   throw 1;
; }

; CHECK: DW_TAG_subprogram
; CHECK-NOT: DW_TAG
; CHECK: DW_AT_name{{.*}}"f"
; CHECK-NOT: DW_TAG
; CHECK: DW_AT_noreturn

; ModuleID = './test.c'
source_filename = "./test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noreturn
define void @f() #0 !dbg !6 {
entry:
  call void @exit(i32 0) #2, !dbg !10
  unreachable, !dbg !10

return:                                           ; No predecessors!
  ret void, !dbg !11
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 4.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "test.c", directory: "/home/del/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{!"clang version 4.0.0"}
!6 = distinct !DISubprogram(name: "f", scope: !7, file: !7, line: 3, type: !8, isLocal: false, isDefinition: true, scopeLine: 4, flags: DIFlagNoReturn, isOptimized: false, unit: !0, retainedNodes: !2)
!7 = !DIFile(filename: "./test.c", directory: "/home/del/test")
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 5, column: 3, scope: !6)
!11 = !DILocation(line: 6, column: 1, scope: !6)
