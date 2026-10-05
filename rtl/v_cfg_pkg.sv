package v_cfg_pkg;

    localparam int VLEN      = 128;           // vector register width in bits
    localparam int ELEN      = 32;            // max element width == one lane's datapath width
    localparam int XLEN      = 32;            // scalar register width
    localparam int NUM_LANES = VLEN / ELEN;   

endpackage