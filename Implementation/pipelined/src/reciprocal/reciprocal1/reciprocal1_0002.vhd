-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 20.1 (Release Build #720)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2020 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from reciprocal1_0002
-- VHDL created on Tue Dec 31 20:48:08 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity reciprocal1_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end reciprocal1_0002;

architecture normal of reciprocal1_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid7_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal singX_uid8_fpInverseTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWF_uid10_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstNaNWF_uid11_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid12_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2BiasM1_uid13_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cst2Bias_uid14_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid21_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid21_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid22_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid22_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid23_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid23_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid24_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid25_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid25_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid26_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid26_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid27_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid28_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid29_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid30_fpInverseTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal updatedY_uid32_fpInverseTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid34_fpInverseTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal y_uid34_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCompExt_uid39_fpInverseTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompExt_uid39_fpInverseTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRComp_uid40_fpInverseTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRComp_uid40_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal udf_uid41_fpInverseTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal udf_uid41_fpInverseTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOneExt_uid42_fpInverseTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expRCompYIsOne_uid43_fpInverseTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRCompYIsOne_uid43_fpInverseTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fxpInverseRes_uid44_fpInverseTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal fxpInverseRes_uid44_fpInverseTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal paddingY_uid47_fpInverseTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal updatedY_uid48_fpInverseTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal pGTEOne_uid47_fpInverseTest_a : STD_LOGIC_VECTOR (50 downto 0);
    signal pGTEOne_uid47_fpInverseTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal pGTEOne_uid47_fpInverseTest_o : STD_LOGIC_VECTOR (50 downto 0);
    signal pGTEOne_uid47_fpInverseTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal pLTOne_uid50_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseResPostUpdateE_uid52_fpInverseTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInverseResPostUpdateE_uid52_fpInverseTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInverseResPostUpdateE_uid52_fpInverseTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInverseResPostUpdateE_uid52_fpInverseTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal invYIsOne_uid55_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invIsOnePostCR_uid56_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invOneCond_uid57_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseResFrac_uid59_fpInverseTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fxpInverseResFrac_uid59_fpInverseTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRCalc_uid60_fpInverseTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCalc_uid60_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRCalc_uid61_fpInverseTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCalc_uid61_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal xRegAndUdf_uid62_fpInverseTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndUdf_uid62_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIOrXRUdf_uid63_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid64_fpInverseTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid65_fpInverseTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid67_fpInverseTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid67_fpInverseTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid68_fpInverseTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid68_fpInverseTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid69_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid70_fpInverseTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid71_fpInverseTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal os_uid75_inverseTables_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yT1_uid86_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal lowRangeB_uid88_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid88_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid89_invPolyEval_b : STD_LOGIC_VECTOR (10 downto 0);
    signal s1sumAHighB_uid90_invPolyEval_a : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid90_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid90_invPolyEval_o : STD_LOGIC_VECTOR (20 downto 0);
    signal s1sumAHighB_uid90_invPolyEval_q : STD_LOGIC_VECTOR (20 downto 0);
    signal s1_uid91_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal lowRangeB_uid94_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid94_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid95_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal s2sumAHighB_uid96_invPolyEval_a : STD_LOGIC_VECTOR (30 downto 0);
    signal s2sumAHighB_uid96_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal s2sumAHighB_uid96_invPolyEval_o : STD_LOGIC_VECTOR (30 downto 0);
    signal s2sumAHighB_uid96_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal s2_uid97_invPolyEval_q : STD_LOGIC_VECTOR (32 downto 0);
    signal osig_uid100_pT1_uid87_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal osig_uid103_pT2_uid93_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal memoryC0_uid73_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid73_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid73_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid73_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid73_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid73_inverseTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid74_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid74_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid74_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid74_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid74_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid74_inverseTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid77_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid77_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid77_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid77_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid77_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid77_inverseTables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC2_uid80_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid80_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid80_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid80_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid80_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid80_inverseTables_lutmem_r : STD_LOGIC_VECTOR (10 downto 0);
    signal p_uid45_fpInverseTest_cma_reset : std_logic;
    type p_uid45_fpInverseTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(24 downto 0);
    signal p_uid45_fpInverseTest_cma_a0 : p_uid45_fpInverseTest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of p_uid45_fpInverseTest_cma_a0 : signal is true;
    type p_uid45_fpInverseTest_cma_c0type is array(NATURAL range <>) of UNSIGNED(23 downto 0);
    signal p_uid45_fpInverseTest_cma_c0 : p_uid45_fpInverseTest_cma_c0type(0 to 0);
    attribute preserve of p_uid45_fpInverseTest_cma_c0 : signal is true;
    type p_uid45_fpInverseTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(48 downto 0);
    signal p_uid45_fpInverseTest_cma_p : p_uid45_fpInverseTest_cma_ptype(0 to 0);
    signal p_uid45_fpInverseTest_cma_u : p_uid45_fpInverseTest_cma_ptype(0 to 0);
    signal p_uid45_fpInverseTest_cma_w : p_uid45_fpInverseTest_cma_ptype(0 to 0);
    signal p_uid45_fpInverseTest_cma_x : p_uid45_fpInverseTest_cma_ptype(0 to 0);
    signal p_uid45_fpInverseTest_cma_y : p_uid45_fpInverseTest_cma_ptype(0 to 0);
    signal p_uid45_fpInverseTest_cma_s : p_uid45_fpInverseTest_cma_ptype(0 to 0);
    signal p_uid45_fpInverseTest_cma_qq : STD_LOGIC_VECTOR (48 downto 0);
    signal p_uid45_fpInverseTest_cma_q : STD_LOGIC_VECTOR (48 downto 0);
    signal p_uid45_fpInverseTest_cma_ena0 : std_logic;
    signal p_uid45_fpInverseTest_cma_ena1 : std_logic;
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_reset : std_logic;
    type prodXY_uid99_pT1_uid87_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(10 downto 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_a0 : prodXY_uid99_pT1_uid87_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid99_pT1_uid87_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid99_pT1_uid87_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_c0 : prodXY_uid99_pT1_uid87_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid99_pT1_uid87_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid99_pT1_uid87_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_l : prodXY_uid99_pT1_uid87_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid99_pT1_uid87_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(22 downto 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_p : prodXY_uid99_pT1_uid87_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_u : prodXY_uid99_pT1_uid87_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_w : prodXY_uid99_pT1_uid87_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_x : prodXY_uid99_pT1_uid87_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_y : prodXY_uid99_pT1_uid87_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_s : prodXY_uid99_pT1_uid87_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_qq : STD_LOGIC_VECTOR (21 downto 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_q : STD_LOGIC_VECTOR (21 downto 0);
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid99_pT1_uid87_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_reset : std_logic;
    type prodXY_uid102_pT2_uid93_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_a0 : prodXY_uid102_pT2_uid93_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid102_pT2_uid93_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid102_pT2_uid93_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(21 downto 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_c0 : prodXY_uid102_pT2_uid93_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid102_pT2_uid93_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid102_pT2_uid93_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_l : prodXY_uid102_pT2_uid93_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid102_pT2_uid93_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(36 downto 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_p : prodXY_uid102_pT2_uid93_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_u : prodXY_uid102_pT2_uid93_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_w : prodXY_uid102_pT2_uid93_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_x : prodXY_uid102_pT2_uid93_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_y : prodXY_uid102_pT2_uid93_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_s : prodXY_uid102_pT2_uid93_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid102_pT2_uid93_invPolyEval_cma_ena1 : std_logic;
    signal yAddr_uid36_fpInverseTest_merged_bit_select_b : STD_LOGIC_VECTOR (8 downto 0);
    signal yAddr_uid36_fpInverseTest_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_c : STD_LOGIC_VECTOR (23 downto 0);
    signal redist0_fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist2_yAddr_uid36_fpInverseTest_merged_bit_select_b_5_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist4_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist5_p_uid45_fpInverseTest_cma_q_1_q : STD_LOGIC_VECTOR (48 downto 0);
    signal redist6_memoryC0_uid74_inverseTables_lutmem_r_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist7_memoryC0_uid73_inverseTables_lutmem_r_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist8_osig_uid103_pT2_uid93_invPolyEval_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_lowRangeB_uid88_invPolyEval_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_fxpInverseResFrac_uid59_fpInverseTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist11_fxpInverseRes_uid44_fpInverseTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist13_fracXIsZero_uid31_fpInverseTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_fracXIsZero_uid23_fpInverseTest_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_excZ_x_uid21_fpInverseTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_singX_uid8_fpInverseTest_b_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_expX_uid6_fpInverseTest_b_14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_reset0 : std_logic;
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_ia : STD_LOGIC_VECTOR (24 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_iq : STD_LOGIC_VECTOR (24 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i : signal is true;
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_eq : std_logic;
    attribute preserve of redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_eq : signal is true;
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist12_fxpInverseRes_uid44_fpInverseTest_b_5_sticky_ena_q : signal is true;
    signal redist12_fxpInverseRes_uid44_fpInverseTest_b_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_mem_reset0 : std_logic;
    signal redist14_oFracX_uid30_fpInverseTest_q_9_mem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_mem_iq : STD_LOGIC_VECTOR (23 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_mem_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_i : signal is true;
    signal redist14_oFracX_uid30_fpInverseTest_q_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_oFracX_uid30_fpInverseTest_q_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist14_oFracX_uid30_fpInverseTest_q_9_sticky_ena_q : signal is true;
    signal redist14_oFracX_uid30_fpInverseTest_q_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_mem_reset0 : std_logic;
    signal redist18_expX_uid6_fpInverseTest_b_13_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i : signal is true;
    signal redist18_expX_uid6_fpInverseTest_b_13_rdcnt_eq : std_logic;
    attribute preserve of redist18_expX_uid6_fpInverseTest_b_13_rdcnt_eq : signal is true;
    signal redist18_expX_uid6_fpInverseTest_b_13_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_expX_uid6_fpInverseTest_b_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist18_expX_uid6_fpInverseTest_b_13_sticky_ena_q : signal is true;
    signal redist18_expX_uid6_fpInverseTest_b_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- fracX_uid7_fpInverseTest(BITSELECT,6)@0
    fracX_uid7_fpInverseTest_b <= a(22 downto 0);

    -- cstAllZWF_uid10_fpInverseTest(CONSTANT,9)
    cstAllZWF_uid10_fpInverseTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid23_fpInverseTest(LOGICAL,22)@0 + 1
    fracXIsZero_uid23_fpInverseTest_qi <= "1" WHEN cstAllZWF_uid10_fpInverseTest_q = fracX_uid7_fpInverseTest_b ELSE "0";
    fracXIsZero_uid23_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid23_fpInverseTest_qi, xout => fracXIsZero_uid23_fpInverseTest_q, clk => clk, aclr => areset );

    -- redist15_fracXIsZero_uid23_fpInverseTest_q_14(DELAY,128)
    redist15_fracXIsZero_uid23_fpInverseTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid23_fpInverseTest_q, xout => redist15_fracXIsZero_uid23_fpInverseTest_q_14_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid24_fpInverseTest(LOGICAL,23)@14
    fracXIsNotZero_uid24_fpInverseTest_q <= not (redist15_fracXIsZero_uid23_fpInverseTest_q_14_q);

    -- cstAllOWE_uid9_fpInverseTest(CONSTANT,8)
    cstAllOWE_uid9_fpInverseTest_q <= "11111111";

    -- redist18_expX_uid6_fpInverseTest_b_13_notEnable(LOGICAL,160)
    redist18_expX_uid6_fpInverseTest_b_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist18_expX_uid6_fpInverseTest_b_13_nor(LOGICAL,161)
    redist18_expX_uid6_fpInverseTest_b_13_nor_q <= not (redist18_expX_uid6_fpInverseTest_b_13_notEnable_q or redist18_expX_uid6_fpInverseTest_b_13_sticky_ena_q);

    -- redist18_expX_uid6_fpInverseTest_b_13_mem_last(CONSTANT,157)
    redist18_expX_uid6_fpInverseTest_b_13_mem_last_q <= "01001";

    -- redist18_expX_uid6_fpInverseTest_b_13_cmp(LOGICAL,158)
    redist18_expX_uid6_fpInverseTest_b_13_cmp_b <= STD_LOGIC_VECTOR("0" & redist18_expX_uid6_fpInverseTest_b_13_rdcnt_q);
    redist18_expX_uid6_fpInverseTest_b_13_cmp_q <= "1" WHEN redist18_expX_uid6_fpInverseTest_b_13_mem_last_q = redist18_expX_uid6_fpInverseTest_b_13_cmp_b ELSE "0";

    -- redist18_expX_uid6_fpInverseTest_b_13_cmpReg(REG,159)
    redist18_expX_uid6_fpInverseTest_b_13_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist18_expX_uid6_fpInverseTest_b_13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist18_expX_uid6_fpInverseTest_b_13_cmpReg_q <= STD_LOGIC_VECTOR(redist18_expX_uid6_fpInverseTest_b_13_cmp_q);
        END IF;
    END PROCESS;

    -- redist18_expX_uid6_fpInverseTest_b_13_sticky_ena(REG,162)
    redist18_expX_uid6_fpInverseTest_b_13_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist18_expX_uid6_fpInverseTest_b_13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist18_expX_uid6_fpInverseTest_b_13_nor_q = "1") THEN
                redist18_expX_uid6_fpInverseTest_b_13_sticky_ena_q <= STD_LOGIC_VECTOR(redist18_expX_uid6_fpInverseTest_b_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_expX_uid6_fpInverseTest_b_13_enaAnd(LOGICAL,163)
    redist18_expX_uid6_fpInverseTest_b_13_enaAnd_q <= redist18_expX_uid6_fpInverseTest_b_13_sticky_ena_q and VCC_q;

    -- redist18_expX_uid6_fpInverseTest_b_13_rdcnt(COUNTER,155)
    -- low=0, high=10, step=1, init=0
    redist18_expX_uid6_fpInverseTest_b_13_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist18_expX_uid6_fpInverseTest_b_13_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i = TO_UNSIGNED(9, 4)) THEN
                redist18_expX_uid6_fpInverseTest_b_13_rdcnt_eq <= '1';
            ELSE
                redist18_expX_uid6_fpInverseTest_b_13_rdcnt_eq <= '0';
            END IF;
            IF (redist18_expX_uid6_fpInverseTest_b_13_rdcnt_eq = '1') THEN
                redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i <= redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i + 6;
            ELSE
                redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i <= redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist18_expX_uid6_fpInverseTest_b_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist18_expX_uid6_fpInverseTest_b_13_rdcnt_i, 4)));

    -- expX_uid6_fpInverseTest(BITSELECT,5)@0
    expX_uid6_fpInverseTest_b <= a(30 downto 23);

    -- redist18_expX_uid6_fpInverseTest_b_13_wraddr(REG,156)
    redist18_expX_uid6_fpInverseTest_b_13_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist18_expX_uid6_fpInverseTest_b_13_wraddr_q <= "1010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist18_expX_uid6_fpInverseTest_b_13_wraddr_q <= STD_LOGIC_VECTOR(redist18_expX_uid6_fpInverseTest_b_13_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist18_expX_uid6_fpInverseTest_b_13_mem(DUALMEM,154)
    redist18_expX_uid6_fpInverseTest_b_13_mem_ia <= STD_LOGIC_VECTOR(expX_uid6_fpInverseTest_b);
    redist18_expX_uid6_fpInverseTest_b_13_mem_aa <= redist18_expX_uid6_fpInverseTest_b_13_wraddr_q;
    redist18_expX_uid6_fpInverseTest_b_13_mem_ab <= redist18_expX_uid6_fpInverseTest_b_13_rdcnt_q;
    redist18_expX_uid6_fpInverseTest_b_13_mem_reset0 <= areset;
    redist18_expX_uid6_fpInverseTest_b_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 11,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist18_expX_uid6_fpInverseTest_b_13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist18_expX_uid6_fpInverseTest_b_13_mem_reset0,
        clock1 => clk,
        address_a => redist18_expX_uid6_fpInverseTest_b_13_mem_aa,
        data_a => redist18_expX_uid6_fpInverseTest_b_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist18_expX_uid6_fpInverseTest_b_13_mem_ab,
        q_b => redist18_expX_uid6_fpInverseTest_b_13_mem_iq
    );
    redist18_expX_uid6_fpInverseTest_b_13_mem_q <= redist18_expX_uid6_fpInverseTest_b_13_mem_iq(7 downto 0);

    -- redist18_expX_uid6_fpInverseTest_b_13_outputreg(DELAY,153)
    redist18_expX_uid6_fpInverseTest_b_13_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist18_expX_uid6_fpInverseTest_b_13_mem_q, xout => redist18_expX_uid6_fpInverseTest_b_13_outputreg_q, clk => clk, aclr => areset );

    -- expXIsMax_uid22_fpInverseTest(LOGICAL,21)@13 + 1
    expXIsMax_uid22_fpInverseTest_qi <= "1" WHEN redist18_expX_uid6_fpInverseTest_b_13_outputreg_q = cstAllOWE_uid9_fpInverseTest_q ELSE "0";
    expXIsMax_uid22_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid22_fpInverseTest_qi, xout => expXIsMax_uid22_fpInverseTest_q, clk => clk, aclr => areset );

    -- excN_x_uid26_fpInverseTest(LOGICAL,25)@14 + 1
    excN_x_uid26_fpInverseTest_qi <= expXIsMax_uid22_fpInverseTest_q and fracXIsNotZero_uid24_fpInverseTest_q;
    excN_x_uid26_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid26_fpInverseTest_qi, xout => excN_x_uid26_fpInverseTest_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid69_fpInverseTest(LOGICAL,68)@15
    invExcRNaN_uid69_fpInverseTest_q <= not (excN_x_uid26_fpInverseTest_q);

    -- singX_uid8_fpInverseTest(BITSELECT,7)@0
    singX_uid8_fpInverseTest_b <= STD_LOGIC_VECTOR(a(31 downto 31));

    -- redist17_singX_uid8_fpInverseTest_b_15(DELAY,130)
    redist17_singX_uid8_fpInverseTest_b_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => singX_uid8_fpInverseTest_b, xout => redist17_singX_uid8_fpInverseTest_b_15_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signR_uid70_fpInverseTest(LOGICAL,69)@15
    signR_uid70_fpInverseTest_q <= redist17_singX_uid8_fpInverseTest_b_15_q and invExcRNaN_uid69_fpInverseTest_q;

    -- redist19_expX_uid6_fpInverseTest_b_14(DELAY,132)
    redist19_expX_uid6_fpInverseTest_b_14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist18_expX_uid6_fpInverseTest_b_13_outputreg_q, xout => redist19_expX_uid6_fpInverseTest_b_14_q, clk => clk, aclr => areset );

    -- cst2Bias_uid14_fpInverseTest(CONSTANT,13)
    cst2Bias_uid14_fpInverseTest_q <= "11111110";

    -- expRCompYIsOneExt_uid42_fpInverseTest(SUB,41)@14
    expRCompYIsOneExt_uid42_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid14_fpInverseTest_q);
    expRCompYIsOneExt_uid42_fpInverseTest_b <= STD_LOGIC_VECTOR("0" & redist19_expX_uid6_fpInverseTest_b_14_q);
    expRCompYIsOneExt_uid42_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid42_fpInverseTest_a) - UNSIGNED(expRCompYIsOneExt_uid42_fpInverseTest_b));
    expRCompYIsOneExt_uid42_fpInverseTest_q <= expRCompYIsOneExt_uid42_fpInverseTest_o(8 downto 0);

    -- expRCompYIsOne_uid43_fpInverseTest(BITSELECT,42)@14
    expRCompYIsOne_uid43_fpInverseTest_in <= expRCompYIsOneExt_uid42_fpInverseTest_q(7 downto 0);
    expRCompYIsOne_uid43_fpInverseTest_b <= expRCompYIsOne_uid43_fpInverseTest_in(7 downto 0);

    -- cst2BiasM1_uid13_fpInverseTest(CONSTANT,12)
    cst2BiasM1_uid13_fpInverseTest_q <= "11111101";

    -- expRCompExt_uid39_fpInverseTest(SUB,38)@14
    expRCompExt_uid39_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid13_fpInverseTest_q);
    expRCompExt_uid39_fpInverseTest_b <= STD_LOGIC_VECTOR("0" & redist19_expX_uid6_fpInverseTest_b_14_q);
    expRCompExt_uid39_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid39_fpInverseTest_a) - UNSIGNED(expRCompExt_uid39_fpInverseTest_b));
    expRCompExt_uid39_fpInverseTest_q <= expRCompExt_uid39_fpInverseTest_o(8 downto 0);

    -- expRComp_uid40_fpInverseTest(BITSELECT,39)@14
    expRComp_uid40_fpInverseTest_in <= expRCompExt_uid39_fpInverseTest_q(7 downto 0);
    expRComp_uid40_fpInverseTest_b <= expRComp_uid40_fpInverseTest_in(7 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- paddingY_uid47_fpInverseTest(CONSTANT,46)
    paddingY_uid47_fpInverseTest_q <= "000000000000000000000000000000000000000000000000";

    -- updatedY_uid48_fpInverseTest(BITJOIN,47)@12
    updatedY_uid48_fpInverseTest_q <= VCC_q & paddingY_uid47_fpInverseTest_q;

    -- redist14_oFracX_uid30_fpInverseTest_q_9_notEnable(LOGICAL,149)
    redist14_oFracX_uid30_fpInverseTest_q_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist14_oFracX_uid30_fpInverseTest_q_9_nor(LOGICAL,150)
    redist14_oFracX_uid30_fpInverseTest_q_9_nor_q <= not (redist14_oFracX_uid30_fpInverseTest_q_9_notEnable_q or redist14_oFracX_uid30_fpInverseTest_q_9_sticky_ena_q);

    -- redist14_oFracX_uid30_fpInverseTest_q_9_mem_last(CONSTANT,146)
    redist14_oFracX_uid30_fpInverseTest_q_9_mem_last_q <= "0110";

    -- redist14_oFracX_uid30_fpInverseTest_q_9_cmp(LOGICAL,147)
    redist14_oFracX_uid30_fpInverseTest_q_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_q);
    redist14_oFracX_uid30_fpInverseTest_q_9_cmp_q <= "1" WHEN redist14_oFracX_uid30_fpInverseTest_q_9_mem_last_q = redist14_oFracX_uid30_fpInverseTest_q_9_cmp_b ELSE "0";

    -- redist14_oFracX_uid30_fpInverseTest_q_9_cmpReg(REG,148)
    redist14_oFracX_uid30_fpInverseTest_q_9_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist14_oFracX_uid30_fpInverseTest_q_9_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist14_oFracX_uid30_fpInverseTest_q_9_cmpReg_q <= STD_LOGIC_VECTOR(redist14_oFracX_uid30_fpInverseTest_q_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist14_oFracX_uid30_fpInverseTest_q_9_sticky_ena(REG,151)
    redist14_oFracX_uid30_fpInverseTest_q_9_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist14_oFracX_uid30_fpInverseTest_q_9_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist14_oFracX_uid30_fpInverseTest_q_9_nor_q = "1") THEN
                redist14_oFracX_uid30_fpInverseTest_q_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist14_oFracX_uid30_fpInverseTest_q_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_oFracX_uid30_fpInverseTest_q_9_enaAnd(LOGICAL,152)
    redist14_oFracX_uid30_fpInverseTest_q_9_enaAnd_q <= redist14_oFracX_uid30_fpInverseTest_q_9_sticky_ena_q and VCC_q;

    -- redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt(COUNTER,144)
    -- low=0, high=7, step=1, init=0
    redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_i <= redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_i, 3)));

    -- oFracX_uid30_fpInverseTest(BITJOIN,29)@0
    oFracX_uid30_fpInverseTest_q <= VCC_q & fracX_uid7_fpInverseTest_b;

    -- redist14_oFracX_uid30_fpInverseTest_q_9_wraddr(REG,145)
    redist14_oFracX_uid30_fpInverseTest_q_9_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist14_oFracX_uid30_fpInverseTest_q_9_wraddr_q <= "111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist14_oFracX_uid30_fpInverseTest_q_9_wraddr_q <= STD_LOGIC_VECTOR(redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist14_oFracX_uid30_fpInverseTest_q_9_mem(DUALMEM,143)
    redist14_oFracX_uid30_fpInverseTest_q_9_mem_ia <= STD_LOGIC_VECTOR(oFracX_uid30_fpInverseTest_q);
    redist14_oFracX_uid30_fpInverseTest_q_9_mem_aa <= redist14_oFracX_uid30_fpInverseTest_q_9_wraddr_q;
    redist14_oFracX_uid30_fpInverseTest_q_9_mem_ab <= redist14_oFracX_uid30_fpInverseTest_q_9_rdcnt_q;
    redist14_oFracX_uid30_fpInverseTest_q_9_mem_reset0 <= areset;
    redist14_oFracX_uid30_fpInverseTest_q_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 24,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist14_oFracX_uid30_fpInverseTest_q_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist14_oFracX_uid30_fpInverseTest_q_9_mem_reset0,
        clock1 => clk,
        address_a => redist14_oFracX_uid30_fpInverseTest_q_9_mem_aa,
        data_a => redist14_oFracX_uid30_fpInverseTest_q_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist14_oFracX_uid30_fpInverseTest_q_9_mem_ab,
        q_b => redist14_oFracX_uid30_fpInverseTest_q_9_mem_iq
    );
    redist14_oFracX_uid30_fpInverseTest_q_9_mem_q <= redist14_oFracX_uid30_fpInverseTest_q_9_mem_iq(23 downto 0);

    -- y_uid34_fpInverseTest(BITSELECT,33)@0
    y_uid34_fpInverseTest_in <= oFracX_uid30_fpInverseTest_q(22 downto 0);
    y_uid34_fpInverseTest_b <= y_uid34_fpInverseTest_in(22 downto 0);

    -- yAddr_uid36_fpInverseTest_merged_bit_select(BITSELECT,111)@0
    yAddr_uid36_fpInverseTest_merged_bit_select_b <= y_uid34_fpInverseTest_b(22 downto 14);
    yAddr_uid36_fpInverseTest_merged_bit_select_c <= y_uid34_fpInverseTest_b(13 downto 0);

    -- memoryC2_uid80_inverseTables_lutmem(DUALMEM,107)@0 + 2
    -- in j@20000000
    memoryC2_uid80_inverseTables_lutmem_aa <= yAddr_uid36_fpInverseTest_merged_bit_select_b;
    memoryC2_uid80_inverseTables_lutmem_reset0 <= areset;
    memoryC2_uid80_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 11,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "reciprocal1_0002_memoryC2_uid80_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid80_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid80_inverseTables_lutmem_aa,
        q_a => memoryC2_uid80_inverseTables_lutmem_ir
    );
    memoryC2_uid80_inverseTables_lutmem_r <= memoryC2_uid80_inverseTables_lutmem_ir(10 downto 0);

    -- redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_2(DELAY,116)
    redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 14, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid36_fpInverseTest_merged_bit_select_c, xout => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- yT1_uid86_invPolyEval(BITSELECT,85)@2
    yT1_uid86_invPolyEval_b <= redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q(13 downto 3);

    -- prodXY_uid99_pT1_uid87_invPolyEval_cma(CHAINMULTADD,109)@2 + 2
    prodXY_uid99_pT1_uid87_invPolyEval_cma_reset <= areset;
    prodXY_uid99_pT1_uid87_invPolyEval_cma_ena0 <= '1';
    prodXY_uid99_pT1_uid87_invPolyEval_cma_ena1 <= prodXY_uid99_pT1_uid87_invPolyEval_cma_ena0;
    prodXY_uid99_pT1_uid87_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid99_pT1_uid87_invPolyEval_cma_a0(0),12));
    prodXY_uid99_pT1_uid87_invPolyEval_cma_p(0) <= prodXY_uid99_pT1_uid87_invPolyEval_cma_l(0) * prodXY_uid99_pT1_uid87_invPolyEval_cma_c0(0);
    prodXY_uid99_pT1_uid87_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid99_pT1_uid87_invPolyEval_cma_p(0),23);
    prodXY_uid99_pT1_uid87_invPolyEval_cma_w(0) <= prodXY_uid99_pT1_uid87_invPolyEval_cma_u(0);
    prodXY_uid99_pT1_uid87_invPolyEval_cma_x(0) <= prodXY_uid99_pT1_uid87_invPolyEval_cma_w(0);
    prodXY_uid99_pT1_uid87_invPolyEval_cma_y(0) <= prodXY_uid99_pT1_uid87_invPolyEval_cma_x(0);
    prodXY_uid99_pT1_uid87_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid99_pT1_uid87_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid99_pT1_uid87_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid99_pT1_uid87_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid99_pT1_uid87_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid86_invPolyEval_b),11);
                prodXY_uid99_pT1_uid87_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC2_uid80_inverseTables_lutmem_r),11);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid99_pT1_uid87_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid99_pT1_uid87_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid99_pT1_uid87_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid99_pT1_uid87_invPolyEval_cma_s(0) <= prodXY_uid99_pT1_uid87_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid99_pT1_uid87_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 22, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid99_pT1_uid87_invPolyEval_cma_s(0)(21 downto 0)), xout => prodXY_uid99_pT1_uid87_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid99_pT1_uid87_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid99_pT1_uid87_invPolyEval_cma_qq(21 downto 0));

    -- osig_uid100_pT1_uid87_invPolyEval(BITSELECT,99)@4
    osig_uid100_pT1_uid87_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid99_pT1_uid87_invPolyEval_cma_q(21 downto 10));

    -- highBBits_uid89_invPolyEval(BITSELECT,88)@4
    highBBits_uid89_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid100_pT1_uid87_invPolyEval_b(11 downto 1));

    -- redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_2(DELAY,114)
    redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid36_fpInverseTest_merged_bit_select_b, xout => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC1_uid77_inverseTables_lutmem(DUALMEM,106)@2 + 2
    -- in j@20000000
    memoryC1_uid77_inverseTables_lutmem_aa <= redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_2_q;
    memoryC1_uid77_inverseTables_lutmem_reset0 <= areset;
    memoryC1_uid77_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "reciprocal1_0002_memoryC1_uid77_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid77_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid77_inverseTables_lutmem_aa,
        q_a => memoryC1_uid77_inverseTables_lutmem_ir
    );
    memoryC1_uid77_inverseTables_lutmem_r <= memoryC1_uid77_inverseTables_lutmem_ir(19 downto 0);

    -- s1sumAHighB_uid90_invPolyEval(ADD,89)@4 + 1
    s1sumAHighB_uid90_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => memoryC1_uid77_inverseTables_lutmem_r(19)) & memoryC1_uid77_inverseTables_lutmem_r));
    s1sumAHighB_uid90_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 11 => highBBits_uid89_invPolyEval_b(10)) & highBBits_uid89_invPolyEval_b));
    s1sumAHighB_uid90_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            s1sumAHighB_uid90_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            s1sumAHighB_uid90_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid90_invPolyEval_a) + SIGNED(s1sumAHighB_uid90_invPolyEval_b));
        END IF;
    END PROCESS;
    s1sumAHighB_uid90_invPolyEval_q <= s1sumAHighB_uid90_invPolyEval_o(20 downto 0);

    -- lowRangeB_uid88_invPolyEval(BITSELECT,87)@4
    lowRangeB_uid88_invPolyEval_in <= osig_uid100_pT1_uid87_invPolyEval_b(0 downto 0);
    lowRangeB_uid88_invPolyEval_b <= lowRangeB_uid88_invPolyEval_in(0 downto 0);

    -- redist9_lowRangeB_uid88_invPolyEval_b_1(DELAY,122)
    redist9_lowRangeB_uid88_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid88_invPolyEval_b, xout => redist9_lowRangeB_uid88_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- s1_uid91_invPolyEval(BITJOIN,90)@5
    s1_uid91_invPolyEval_q <= s1sumAHighB_uid90_invPolyEval_q & redist9_lowRangeB_uid88_invPolyEval_b_1_q;

    -- redist4_yAddr_uid36_fpInverseTest_merged_bit_select_c_5(DELAY,117)
    redist4_yAddr_uid36_fpInverseTest_merged_bit_select_c_5 : dspba_delay
    GENERIC MAP ( width => 14, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist3_yAddr_uid36_fpInverseTest_merged_bit_select_c_2_q, xout => redist4_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_q, clk => clk, aclr => areset );

    -- prodXY_uid102_pT2_uid93_invPolyEval_cma(CHAINMULTADD,110)@5 + 2
    prodXY_uid102_pT2_uid93_invPolyEval_cma_reset <= areset;
    prodXY_uid102_pT2_uid93_invPolyEval_cma_ena0 <= '1';
    prodXY_uid102_pT2_uid93_invPolyEval_cma_ena1 <= prodXY_uid102_pT2_uid93_invPolyEval_cma_ena0;
    prodXY_uid102_pT2_uid93_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid102_pT2_uid93_invPolyEval_cma_a0(0),15));
    prodXY_uid102_pT2_uid93_invPolyEval_cma_p(0) <= prodXY_uid102_pT2_uid93_invPolyEval_cma_l(0) * prodXY_uid102_pT2_uid93_invPolyEval_cma_c0(0);
    prodXY_uid102_pT2_uid93_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid102_pT2_uid93_invPolyEval_cma_p(0),37);
    prodXY_uid102_pT2_uid93_invPolyEval_cma_w(0) <= prodXY_uid102_pT2_uid93_invPolyEval_cma_u(0);
    prodXY_uid102_pT2_uid93_invPolyEval_cma_x(0) <= prodXY_uid102_pT2_uid93_invPolyEval_cma_w(0);
    prodXY_uid102_pT2_uid93_invPolyEval_cma_y(0) <= prodXY_uid102_pT2_uid93_invPolyEval_cma_x(0);
    prodXY_uid102_pT2_uid93_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid102_pT2_uid93_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid102_pT2_uid93_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid102_pT2_uid93_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid102_pT2_uid93_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist4_yAddr_uid36_fpInverseTest_merged_bit_select_c_5_q),14);
                prodXY_uid102_pT2_uid93_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid91_invPolyEval_q),22);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid102_pT2_uid93_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid102_pT2_uid93_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid102_pT2_uid93_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid102_pT2_uid93_invPolyEval_cma_s(0) <= prodXY_uid102_pT2_uid93_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid102_pT2_uid93_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid102_pT2_uid93_invPolyEval_cma_s(0)(35 downto 0)), xout => prodXY_uid102_pT2_uid93_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid102_pT2_uid93_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid102_pT2_uid93_invPolyEval_cma_qq(35 downto 0));

    -- osig_uid103_pT2_uid93_invPolyEval(BITSELECT,102)@7
    osig_uid103_pT2_uid93_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid102_pT2_uid93_invPolyEval_cma_q(35 downto 13));

    -- redist8_osig_uid103_pT2_uid93_invPolyEval_b_1(DELAY,121)
    redist8_osig_uid103_pT2_uid93_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid103_pT2_uid93_invPolyEval_b, xout => redist8_osig_uid103_pT2_uid93_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- highBBits_uid95_invPolyEval(BITSELECT,94)@8
    highBBits_uid95_invPolyEval_b <= STD_LOGIC_VECTOR(redist8_osig_uid103_pT2_uid93_invPolyEval_b_1_q(22 downto 2));

    -- redist2_yAddr_uid36_fpInverseTest_merged_bit_select_b_5(DELAY,115)
    redist2_yAddr_uid36_fpInverseTest_merged_bit_select_b_5 : dspba_delay
    GENERIC MAP ( width => 9, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist1_yAddr_uid36_fpInverseTest_merged_bit_select_b_2_q, xout => redist2_yAddr_uid36_fpInverseTest_merged_bit_select_b_5_q, clk => clk, aclr => areset );

    -- memoryC0_uid74_inverseTables_lutmem(DUALMEM,105)@5 + 2
    -- in j@20000000
    memoryC0_uid74_inverseTables_lutmem_aa <= redist2_yAddr_uid36_fpInverseTest_merged_bit_select_b_5_q;
    memoryC0_uid74_inverseTables_lutmem_reset0 <= areset;
    memoryC0_uid74_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "reciprocal1_0002_memoryC0_uid74_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid74_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid74_inverseTables_lutmem_aa,
        q_a => memoryC0_uid74_inverseTables_lutmem_ir
    );
    memoryC0_uid74_inverseTables_lutmem_r <= memoryC0_uid74_inverseTables_lutmem_ir(9 downto 0);

    -- redist6_memoryC0_uid74_inverseTables_lutmem_r_1(DELAY,119)
    redist6_memoryC0_uid74_inverseTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid74_inverseTables_lutmem_r, xout => redist6_memoryC0_uid74_inverseTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- memoryC0_uid73_inverseTables_lutmem(DUALMEM,104)@5 + 2
    -- in j@20000000
    memoryC0_uid73_inverseTables_lutmem_aa <= redist2_yAddr_uid36_fpInverseTest_merged_bit_select_b_5_q;
    memoryC0_uid73_inverseTables_lutmem_reset0 <= areset;
    memoryC0_uid73_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "reciprocal1_0002_memoryC0_uid73_inverseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid73_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid73_inverseTables_lutmem_aa,
        q_a => memoryC0_uid73_inverseTables_lutmem_ir
    );
    memoryC0_uid73_inverseTables_lutmem_r <= memoryC0_uid73_inverseTables_lutmem_ir(19 downto 0);

    -- redist7_memoryC0_uid73_inverseTables_lutmem_r_1(DELAY,120)
    redist7_memoryC0_uid73_inverseTables_lutmem_r_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => memoryC0_uid73_inverseTables_lutmem_r, xout => redist7_memoryC0_uid73_inverseTables_lutmem_r_1_q, clk => clk, aclr => areset );

    -- os_uid75_inverseTables(BITJOIN,74)@8
    os_uid75_inverseTables_q <= redist6_memoryC0_uid74_inverseTables_lutmem_r_1_q & redist7_memoryC0_uid73_inverseTables_lutmem_r_1_q;

    -- s2sumAHighB_uid96_invPolyEval(ADD,95)@8
    s2sumAHighB_uid96_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => os_uid75_inverseTables_q(29)) & os_uid75_inverseTables_q));
    s2sumAHighB_uid96_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 21 => highBBits_uid95_invPolyEval_b(20)) & highBBits_uid95_invPolyEval_b));
    s2sumAHighB_uid96_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid96_invPolyEval_a) + SIGNED(s2sumAHighB_uid96_invPolyEval_b));
    s2sumAHighB_uid96_invPolyEval_q <= s2sumAHighB_uid96_invPolyEval_o(30 downto 0);

    -- lowRangeB_uid94_invPolyEval(BITSELECT,93)@8
    lowRangeB_uid94_invPolyEval_in <= redist8_osig_uid103_pT2_uid93_invPolyEval_b_1_q(1 downto 0);
    lowRangeB_uid94_invPolyEval_b <= lowRangeB_uid94_invPolyEval_in(1 downto 0);

    -- s2_uid97_invPolyEval(BITJOIN,96)@8
    s2_uid97_invPolyEval_q <= s2sumAHighB_uid96_invPolyEval_q & lowRangeB_uid94_invPolyEval_b;

    -- fxpInverseRes_uid44_fpInverseTest(BITSELECT,43)@8
    fxpInverseRes_uid44_fpInverseTest_in <= s2_uid97_invPolyEval_q(29 downto 0);
    fxpInverseRes_uid44_fpInverseTest_b <= fxpInverseRes_uid44_fpInverseTest_in(29 downto 5);

    -- redist11_fxpInverseRes_uid44_fpInverseTest_b_1(DELAY,124)
    redist11_fxpInverseRes_uid44_fpInverseTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fxpInverseRes_uid44_fpInverseTest_b, xout => redist11_fxpInverseRes_uid44_fpInverseTest_b_1_q, clk => clk, aclr => areset );

    -- p_uid45_fpInverseTest_cma(CHAINMULTADD,108)@9 + 2
    p_uid45_fpInverseTest_cma_reset <= areset;
    p_uid45_fpInverseTest_cma_ena0 <= '1';
    p_uid45_fpInverseTest_cma_ena1 <= p_uid45_fpInverseTest_cma_ena0;
    p_uid45_fpInverseTest_cma_p(0) <= p_uid45_fpInverseTest_cma_a0(0) * p_uid45_fpInverseTest_cma_c0(0);
    p_uid45_fpInverseTest_cma_u(0) <= RESIZE(p_uid45_fpInverseTest_cma_p(0),49);
    p_uid45_fpInverseTest_cma_w(0) <= p_uid45_fpInverseTest_cma_u(0);
    p_uid45_fpInverseTest_cma_x(0) <= p_uid45_fpInverseTest_cma_w(0);
    p_uid45_fpInverseTest_cma_y(0) <= p_uid45_fpInverseTest_cma_x(0);
    p_uid45_fpInverseTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p_uid45_fpInverseTest_cma_a0 <= (others => (others => '0'));
            p_uid45_fpInverseTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (p_uid45_fpInverseTest_cma_ena0 = '1') THEN
                p_uid45_fpInverseTest_cma_a0(0) <= RESIZE(UNSIGNED(redist11_fxpInverseRes_uid44_fpInverseTest_b_1_q),25);
                p_uid45_fpInverseTest_cma_c0(0) <= RESIZE(UNSIGNED(redist14_oFracX_uid30_fpInverseTest_q_9_mem_q),24);
            END IF;
        END IF;
    END PROCESS;
    p_uid45_fpInverseTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            p_uid45_fpInverseTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (p_uid45_fpInverseTest_cma_ena1 = '1') THEN
                p_uid45_fpInverseTest_cma_s(0) <= p_uid45_fpInverseTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    p_uid45_fpInverseTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 49, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(p_uid45_fpInverseTest_cma_s(0)(48 downto 0)), xout => p_uid45_fpInverseTest_cma_qq, clk => clk, aclr => areset );
    p_uid45_fpInverseTest_cma_q <= STD_LOGIC_VECTOR(p_uid45_fpInverseTest_cma_qq(48 downto 0));

    -- redist5_p_uid45_fpInverseTest_cma_q_1(DELAY,118)
    redist5_p_uid45_fpInverseTest_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 49, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => p_uid45_fpInverseTest_cma_q, xout => redist5_p_uid45_fpInverseTest_cma_q_1_q, clk => clk, aclr => areset );

    -- pGTEOne_uid47_fpInverseTest(COMPARE,48)@12 + 1
    pGTEOne_uid47_fpInverseTest_a <= STD_LOGIC_VECTOR("00" & redist5_p_uid45_fpInverseTest_cma_q_1_q);
    pGTEOne_uid47_fpInverseTest_b <= STD_LOGIC_VECTOR("00" & updatedY_uid48_fpInverseTest_q);
    pGTEOne_uid47_fpInverseTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            pGTEOne_uid47_fpInverseTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            pGTEOne_uid47_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(pGTEOne_uid47_fpInverseTest_a) - UNSIGNED(pGTEOne_uid47_fpInverseTest_b));
        END IF;
    END PROCESS;
    pGTEOne_uid47_fpInverseTest_n(0) <= not (pGTEOne_uid47_fpInverseTest_o(50));

    -- pLTOne_uid50_fpInverseTest(LOGICAL,49)@13
    pLTOne_uid50_fpInverseTest_q <= not (pGTEOne_uid47_fpInverseTest_n);

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_notEnable(LOGICAL,139)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_nor(LOGICAL,140)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_nor_q <= not (redist12_fxpInverseRes_uid44_fpInverseTest_b_5_notEnable_q or redist12_fxpInverseRes_uid44_fpInverseTest_b_5_sticky_ena_q);

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_last(CONSTANT,136)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_last_q <= "01";

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmp(LOGICAL,137)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmp_q <= "1" WHEN redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_last_q = redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_q ELSE "0";

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmpReg(REG,138)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmpReg_q <= STD_LOGIC_VECTOR(redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_sticky_ena(REG,141)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist12_fxpInverseRes_uid44_fpInverseTest_b_5_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist12_fxpInverseRes_uid44_fpInverseTest_b_5_nor_q = "1") THEN
                redist12_fxpInverseRes_uid44_fpInverseTest_b_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist12_fxpInverseRes_uid44_fpInverseTest_b_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_enaAnd(LOGICAL,142)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_enaAnd_q <= redist12_fxpInverseRes_uid44_fpInverseTest_b_5_sticky_ena_q and VCC_q;

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt(COUNTER,134)
    -- low=0, high=2, step=1, init=0
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_eq <= '1';
            ELSE
                redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_eq <= '0';
            END IF;
            IF (redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_eq = '1') THEN
                redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i <= redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i + 2;
            ELSE
                redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i <= redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_i, 2)));

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_wraddr(REG,135)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist12_fxpInverseRes_uid44_fpInverseTest_b_5_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist12_fxpInverseRes_uid44_fpInverseTest_b_5_wraddr_q <= STD_LOGIC_VECTOR(redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem(DUALMEM,133)
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_ia <= STD_LOGIC_VECTOR(redist11_fxpInverseRes_uid44_fpInverseTest_b_1_q);
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_aa <= redist12_fxpInverseRes_uid44_fpInverseTest_b_5_wraddr_q;
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_ab <= redist12_fxpInverseRes_uid44_fpInverseTest_b_5_rdcnt_q;
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_reset0 <= areset;
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 25,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 25,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist12_fxpInverseRes_uid44_fpInverseTest_b_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_reset0,
        clock1 => clk,
        address_a => redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_aa,
        data_a => redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_ab,
        q_b => redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_iq
    );
    redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_q <= redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_iq(24 downto 0);

    -- fxpInverseResPostUpdateE_uid52_fpInverseTest(ADD,51)@13
    fxpInverseResPostUpdateE_uid52_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & redist12_fxpInverseRes_uid44_fpInverseTest_b_5_mem_q);
    fxpInverseResPostUpdateE_uid52_fpInverseTest_b <= STD_LOGIC_VECTOR("0000000000000000000000000" & pLTOne_uid50_fpInverseTest_q);
    fxpInverseResPostUpdateE_uid52_fpInverseTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpInverseResPostUpdateE_uid52_fpInverseTest_a) + UNSIGNED(fxpInverseResPostUpdateE_uid52_fpInverseTest_b));
    fxpInverseResPostUpdateE_uid52_fpInverseTest_q <= fxpInverseResPostUpdateE_uid52_fpInverseTest_o(25 downto 0);

    -- fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select(BITSELECT,112)@13
    fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_b <= fxpInverseResPostUpdateE_uid52_fpInverseTest_q(25 downto 25);
    fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_c <= fxpInverseResPostUpdateE_uid52_fpInverseTest_q(24 downto 1);

    -- redist0_fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_b_1(DELAY,113)
    redist0_fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_b, xout => redist0_fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- invYIsOne_uid55_fpInverseTest(LOGICAL,54)@14
    invYIsOne_uid55_fpInverseTest_q <= not (redist13_fracXIsZero_uid31_fpInverseTest_q_14_q);

    -- invIsOnePostCR_uid56_fpInverseTest(LOGICAL,55)@14
    invIsOnePostCR_uid56_fpInverseTest_q <= invYIsOne_uid55_fpInverseTest_q and redist0_fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_b_1_q;

    -- updatedY_uid32_fpInverseTest(BITJOIN,31)@0
    updatedY_uid32_fpInverseTest_q <= GND_q & cstAllZWF_uid10_fpInverseTest_q;

    -- fracXIsZero_uid31_fpInverseTest(LOGICAL,32)@0 + 1
    fracXIsZero_uid31_fpInverseTest_a <= STD_LOGIC_VECTOR("0" & fracX_uid7_fpInverseTest_b);
    fracXIsZero_uid31_fpInverseTest_qi <= "1" WHEN fracXIsZero_uid31_fpInverseTest_a = updatedY_uid32_fpInverseTest_q ELSE "0";
    fracXIsZero_uid31_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpInverseTest_qi, xout => fracXIsZero_uid31_fpInverseTest_q, clk => clk, aclr => areset );

    -- redist13_fracXIsZero_uid31_fpInverseTest_q_14(DELAY,126)
    redist13_fracXIsZero_uid31_fpInverseTest_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpInverseTest_q, xout => redist13_fracXIsZero_uid31_fpInverseTest_q_14_q, clk => clk, aclr => areset );

    -- invOneCond_uid57_fpInverseTest(LOGICAL,56)@14
    invOneCond_uid57_fpInverseTest_q <= redist13_fracXIsZero_uid31_fpInverseTest_q_14_q or invIsOnePostCR_uid56_fpInverseTest_q;

    -- expRCalc_uid61_fpInverseTest(MUX,60)@14 + 1
    expRCalc_uid61_fpInverseTest_s <= invOneCond_uid57_fpInverseTest_q;
    expRCalc_uid61_fpInverseTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRCalc_uid61_fpInverseTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (expRCalc_uid61_fpInverseTest_s) IS
                WHEN "0" => expRCalc_uid61_fpInverseTest_q <= expRComp_uid40_fpInverseTest_b;
                WHEN "1" => expRCalc_uid61_fpInverseTest_q <= expRCompYIsOne_uid43_fpInverseTest_b;
                WHEN OTHERS => expRCalc_uid61_fpInverseTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- cstAllZWE_uid12_fpInverseTest(CONSTANT,11)
    cstAllZWE_uid12_fpInverseTest_q <= "00000000";

    -- excZ_x_uid21_fpInverseTest(LOGICAL,20)@13 + 1
    excZ_x_uid21_fpInverseTest_qi <= "1" WHEN redist18_expX_uid6_fpInverseTest_b_13_outputreg_q = cstAllZWE_uid12_fpInverseTest_q ELSE "0";
    excZ_x_uid21_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid21_fpInverseTest_qi, xout => excZ_x_uid21_fpInverseTest_q, clk => clk, aclr => areset );

    -- redist16_excZ_x_uid21_fpInverseTest_q_2(DELAY,129)
    redist16_excZ_x_uid21_fpInverseTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid21_fpInverseTest_q, xout => redist16_excZ_x_uid21_fpInverseTest_q_2_q, clk => clk, aclr => areset );

    -- udf_uid41_fpInverseTest(BITSELECT,40)@14
    udf_uid41_fpInverseTest_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => expRCompExt_uid39_fpInverseTest_q(8)) & expRCompExt_uid39_fpInverseTest_q));
    udf_uid41_fpInverseTest_b <= STD_LOGIC_VECTOR(udf_uid41_fpInverseTest_in(9 downto 9));

    -- invExpXIsMax_uid27_fpInverseTest(LOGICAL,26)@14
    invExpXIsMax_uid27_fpInverseTest_q <= not (expXIsMax_uid22_fpInverseTest_q);

    -- InvExpXIsZero_uid28_fpInverseTest(LOGICAL,27)@14
    InvExpXIsZero_uid28_fpInverseTest_q <= not (excZ_x_uid21_fpInverseTest_q);

    -- excR_x_uid29_fpInverseTest(LOGICAL,28)@14
    excR_x_uid29_fpInverseTest_q <= InvExpXIsZero_uid28_fpInverseTest_q and invExpXIsMax_uid27_fpInverseTest_q;

    -- xRegAndUdf_uid62_fpInverseTest(LOGICAL,61)@14 + 1
    xRegAndUdf_uid62_fpInverseTest_qi <= excR_x_uid29_fpInverseTest_q and udf_uid41_fpInverseTest_b;
    xRegAndUdf_uid62_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xRegAndUdf_uid62_fpInverseTest_qi, xout => xRegAndUdf_uid62_fpInverseTest_q, clk => clk, aclr => areset );

    -- excI_x_uid25_fpInverseTest(LOGICAL,24)@14 + 1
    excI_x_uid25_fpInverseTest_qi <= expXIsMax_uid22_fpInverseTest_q and redist15_fracXIsZero_uid23_fpInverseTest_q_14_q;
    excI_x_uid25_fpInverseTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid25_fpInverseTest_qi, xout => excI_x_uid25_fpInverseTest_q, clk => clk, aclr => areset );

    -- xIOrXRUdf_uid63_fpInverseTest(LOGICAL,62)@15
    xIOrXRUdf_uid63_fpInverseTest_q <= excI_x_uid25_fpInverseTest_q or xRegAndUdf_uid62_fpInverseTest_q;

    -- excSelBits_uid64_fpInverseTest(BITJOIN,63)@15
    excSelBits_uid64_fpInverseTest_q <= excN_x_uid26_fpInverseTest_q & redist16_excZ_x_uid21_fpInverseTest_q_2_q & xIOrXRUdf_uid63_fpInverseTest_q;

    -- outMuxSelEnc_uid65_fpInverseTest(LOOKUP,64)@15
    outMuxSelEnc_uid65_fpInverseTest_combproc: PROCESS (excSelBits_uid64_fpInverseTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid64_fpInverseTest_q) IS
            WHEN "000" => outMuxSelEnc_uid65_fpInverseTest_q <= "01";
            WHEN "001" => outMuxSelEnc_uid65_fpInverseTest_q <= "00";
            WHEN "010" => outMuxSelEnc_uid65_fpInverseTest_q <= "10";
            WHEN "011" => outMuxSelEnc_uid65_fpInverseTest_q <= "01";
            WHEN "100" => outMuxSelEnc_uid65_fpInverseTest_q <= "11";
            WHEN "101" => outMuxSelEnc_uid65_fpInverseTest_q <= "01";
            WHEN "110" => outMuxSelEnc_uid65_fpInverseTest_q <= "01";
            WHEN "111" => outMuxSelEnc_uid65_fpInverseTest_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid65_fpInverseTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid68_fpInverseTest(MUX,67)@15
    expRPostExc_uid68_fpInverseTest_s <= outMuxSelEnc_uid65_fpInverseTest_q;
    expRPostExc_uid68_fpInverseTest_combproc: PROCESS (expRPostExc_uid68_fpInverseTest_s, cstAllZWE_uid12_fpInverseTest_q, expRCalc_uid61_fpInverseTest_q, cstAllOWE_uid9_fpInverseTest_q)
    BEGIN
        CASE (expRPostExc_uid68_fpInverseTest_s) IS
            WHEN "00" => expRPostExc_uid68_fpInverseTest_q <= cstAllZWE_uid12_fpInverseTest_q;
            WHEN "01" => expRPostExc_uid68_fpInverseTest_q <= expRCalc_uid61_fpInverseTest_q;
            WHEN "10" => expRPostExc_uid68_fpInverseTest_q <= cstAllOWE_uid9_fpInverseTest_q;
            WHEN "11" => expRPostExc_uid68_fpInverseTest_q <= cstAllOWE_uid9_fpInverseTest_q;
            WHEN OTHERS => expRPostExc_uid68_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid11_fpInverseTest(CONSTANT,10)
    cstNaNWF_uid11_fpInverseTest_q <= "00000000000000000000001";

    -- fxpInverseResFrac_uid59_fpInverseTest(BITSELECT,58)@13
    fxpInverseResFrac_uid59_fpInverseTest_in <= fxpInverseResExpUpdate_uid53_fpInverseTest_merged_bit_select_c(22 downto 0);
    fxpInverseResFrac_uid59_fpInverseTest_b <= fxpInverseResFrac_uid59_fpInverseTest_in(22 downto 0);

    -- redist10_fxpInverseResFrac_uid59_fpInverseTest_b_1(DELAY,123)
    redist10_fxpInverseResFrac_uid59_fpInverseTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fxpInverseResFrac_uid59_fpInverseTest_b, xout => redist10_fxpInverseResFrac_uid59_fpInverseTest_b_1_q, clk => clk, aclr => areset );

    -- fracRCalc_uid60_fpInverseTest(MUX,59)@14 + 1
    fracRCalc_uid60_fpInverseTest_s <= invOneCond_uid57_fpInverseTest_q;
    fracRCalc_uid60_fpInverseTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid60_fpInverseTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRCalc_uid60_fpInverseTest_s) IS
                WHEN "0" => fracRCalc_uid60_fpInverseTest_q <= redist10_fxpInverseResFrac_uid59_fpInverseTest_b_1_q;
                WHEN "1" => fracRCalc_uid60_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
                WHEN OTHERS => fracRCalc_uid60_fpInverseTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid67_fpInverseTest(MUX,66)@15
    fracRPostExc_uid67_fpInverseTest_s <= outMuxSelEnc_uid65_fpInverseTest_q;
    fracRPostExc_uid67_fpInverseTest_combproc: PROCESS (fracRPostExc_uid67_fpInverseTest_s, cstAllZWF_uid10_fpInverseTest_q, fracRCalc_uid60_fpInverseTest_q, cstNaNWF_uid11_fpInverseTest_q)
    BEGIN
        CASE (fracRPostExc_uid67_fpInverseTest_s) IS
            WHEN "00" => fracRPostExc_uid67_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN "01" => fracRPostExc_uid67_fpInverseTest_q <= fracRCalc_uid60_fpInverseTest_q;
            WHEN "10" => fracRPostExc_uid67_fpInverseTest_q <= cstAllZWF_uid10_fpInverseTest_q;
            WHEN "11" => fracRPostExc_uid67_fpInverseTest_q <= cstNaNWF_uid11_fpInverseTest_q;
            WHEN OTHERS => fracRPostExc_uid67_fpInverseTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid71_fpInverseTest(BITJOIN,70)@15
    R_uid71_fpInverseTest_q <= signR_uid70_fpInverseTest_q & expRPostExc_uid68_fpInverseTest_q & fracRPostExc_uid67_fpInverseTest_q;

    -- xOut(GPOUT,4)@15
    q <= R_uid71_fpInverseTest_q;

END normal;
