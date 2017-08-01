                .syntax     unified
                .cpu        cortex-m4
                .text
                .thumb_func
                .align      2

// int32_t  Remainder2(int32_t s32, int32_t k) ;

                .global     Remainder2
Remainder2:     LDR         R3,=1               // R3 <- 1
                LSL         R1,R3,R1            // R1 <- 1 << k
                SUB         R3,R1,1             // R3 <- (1 << K) - 1
                AND         R3,R3,R0            // R3 <- ((1 << k) - 1) & s32
                AND         R0,R1,R0,ASR 31     // R0 <- (1 << k) && (s32 >> 31)
                SUB         R0,R3,R0            // R0 <- (((1 << k) - 1) & s32) - ((1 << k) && (s32 >> 31))
                BX          LR
                .end
