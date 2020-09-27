# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=bdver2 -instruction-tables < %s | FileCheck %s

vcvtph2ps   %xmm0, %xmm2
vcvtph2ps   (%rax), %xmm2

vcvtph2ps   %xmm0, %ymm2
vcvtph2ps   (%rax), %ymm2

vcvtps2ph   $0, %xmm0, %xmm2
vcvtps2ph   $0, %xmm0, (%rax)

vcvtps2ph   $0, %ymm0, %xmm2
vcvtps2ph   $0, %ymm0, (%rax)

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  2      8     1.00                        vcvtph2ps	%xmm0, %xmm2
# CHECK-NEXT:  3      13    1.00    *                   vcvtph2ps	(%rax), %xmm2
# CHECK-NEXT:  4      8     2.00                        vcvtph2ps	%xmm0, %ymm2
# CHECK-NEXT:  7      13    2.00    *                   vcvtph2ps	(%rax), %ymm2
# CHECK-NEXT:  2      8     1.00                        vcvtps2ph	$0, %xmm0, %xmm2
# CHECK-NEXT:  3      4     1.00           *            vcvtps2ph	$0, %xmm0, (%rax)
# CHECK-NEXT:  4      8     2.00                        vcvtps2ph	$0, %ymm0, %xmm2
# CHECK-NEXT:  4      4     2.00           *            vcvtps2ph	$0, %ymm0, (%rax)

# CHECK:      Resources:
# CHECK-NEXT: [0.0] - PdAGLU01
# CHECK-NEXT: [0.1] - PdAGLU01
# CHECK-NEXT: [1]   - PdBranch
# CHECK-NEXT: [2]   - PdCount
# CHECK-NEXT: [3]   - PdDiv
# CHECK-NEXT: [4]   - PdEX0
# CHECK-NEXT: [5]   - PdEX1
# CHECK-NEXT: [6]   - PdFPCVT
# CHECK-NEXT: [7.0] - PdFPFMA
# CHECK-NEXT: [7.1] - PdFPFMA
# CHECK-NEXT: [8.0] - PdFPMAL
# CHECK-NEXT: [8.1] - PdFPMAL
# CHECK-NEXT: [9]   - PdFPMMA
# CHECK-NEXT: [10]  - PdFPSTO
# CHECK-NEXT: [11]  - PdFPU0
# CHECK-NEXT: [12]  - PdFPU1
# CHECK-NEXT: [13]  - PdFPU2
# CHECK-NEXT: [14]  - PdFPU3
# CHECK-NEXT: [15]  - PdFPXBR
# CHECK-NEXT: [16.0] - PdLoad
# CHECK-NEXT: [16.1] - PdLoad
# CHECK-NEXT: [17]  - PdMul
# CHECK-NEXT: [18]  - PdStore

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0.0]  [0.1]  [1]    [2]    [3]    [4]    [5]    [6]    [7.0]  [7.1]  [8.0]  [8.1]  [9]    [10]   [11]   [12]   [13]   [14]   [15]   [16.0] [16.1] [17]   [18]
# CHECK-NEXT: 2.50   2.50    -      -      -      -      -      -     1.00   1.00    -      -      -     8.00    -     12.00   -      -      -     1.50   1.50    -     2.00

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0.0]  [0.1]  [1]    [2]    [3]    [4]    [5]    [6]    [7.0]  [7.1]  [8.0]  [8.1]  [9]    [10]   [11]   [12]   [13]   [14]   [15]   [16.0] [16.1] [17]   [18]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -     1.00    -     1.00    -      -      -      -      -      -      -     vcvtph2ps	%xmm0, %xmm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     1.00    -     1.00    -      -      -     0.50   0.50    -      -     vcvtph2ps	(%rax), %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -     1.00    -     2.00    -      -      -      -      -      -      -     vcvtph2ps	%xmm0, %ymm2
# CHECK-NEXT: 1.00   1.00    -      -      -      -      -      -      -      -      -      -      -     1.00    -     2.00    -      -      -     1.00   1.00    -      -     vcvtph2ps	(%rax), %ymm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -     1.00    -     1.00    -      -      -      -      -      -      -     vcvtps2ph	$0, %xmm0, %xmm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     1.00    -     1.00    -      -      -      -      -      -     1.00   vcvtps2ph	$0, %xmm0, (%rax)
# CHECK-NEXT:  -      -      -      -      -      -      -      -     0.50   0.50    -      -      -     1.00    -     2.00    -      -      -      -      -      -      -     vcvtps2ph	$0, %ymm0, %xmm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -     0.50   0.50    -      -      -     1.00    -     2.00    -      -      -      -      -      -     1.00   vcvtps2ph	$0, %ymm0, (%rax)
