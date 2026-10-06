package v_cfg_pkg;

    localparam int VLEN      = 128;           // vector register width in bits
    localparam int ELEN      = 32;            // max element width == one lane's datapath width
    localparam int XLEN      = 32;     
    localparam int SEW       = 32;       // scalar register width
    localparam int NUM_LANES = VLEN / ELEN;

    localparam int LMUL_NUM = 1;
    localparam int LMUL_DEN = 1;
    localparam int VLMAX =(VLEN * LMUL_NUM) / (SEW * LMUL_DEN);

    localparam int ELEMENT_IDX_WIDTH = (VLMAX <= 1) ? 1 : $clog2(VLMAX);

    typedef enum logic [1:0] {
        VDIV_SEW8  = 2'b00,
        VDIV_SEW16 = 2'b01,
        VDIV_SEW32 = 2'b10
    } vdiv_sew_e;

    typedef enum logic [1:0] {
        VDIV_DIVU = 2'b00,
        VDIV_DIV  = 2'b01,
        VDIV_REMU = 2'b10,
        VDIV_REM  = 2'b11
    } vdiv_op_e;

    function automatic int unsigned sew_num_elems(vdiv_sew_e sew, int unsigned op_w);
        return op_w / sew_width(sew);
    endfunction

    function automatic int unsigned sew_width(vdiv_sew_e sew);
        unique case (sew)
            VDIV_SEW8:  return 8;
            VDIV_SEW16: return 16;
            default:    return 32;
        endcase
    endfunction

endpackage