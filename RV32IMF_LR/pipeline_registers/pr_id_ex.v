`timescale 1ns/100ps

module pr_id_ex (
    CLK, RESET, 

    ID_PC, ID_REG_DATA1, ID_REG_DATA2, ID_IMMEDIATE,
    ID_FREG_DATA1, ID_FREG_DATA2, ID_FREG_DATA3,
    ID_REG_WRITE_ADDR, ID_REG_READ_ADDR1, ID_REG_READ_ADDR2, ID_REG_READ_ADDR3,
    ID_ALU_SELECT, ID_OPERAND1_SELECT, ID_OPERAND2_SELECT,
    ID_FPU_SELECT, ID_REG_TYPE, ID_REG_WRITE_EN, ID_FREG_WRITE_EN, 
    ID_DATA_MEM_WRITE_DATA_SELECT, ID_DATA_MEM_WRITE, ID_DATA_MEM_READ, 
    ID_BRANCH_CTRL, ID_WB_VALUE_SELECT,

    EX_PC, EX_REG_DATA1, EX_REG_DATA2, EX_IMMEDIATE,
    EX_FREG_DATA1, EX_FREG_DATA2, EX_FREG_DATA3,
    EX_REG_WRITE_ADDR, EX_REG_READ_ADDR1, EX_REG_READ_ADDR2, EX_REG_READ_ADDR3,
    EX_ALU_SELECT, EX_OPERAND1_SELECT, EX_OPERAND2_SELECT,
    EX_FPU_SELECT, EX_REG_TYPE, EX_REG_WRITE_EN, EX_FREG_WRITE_EN,
    EX_DATA_MEM_WRITE_DATA_SELECT, EX_DATA_MEM_WRITE, EX_DATA_MEM_READ,
    EX_BRANCH_CTRL, EX_WB_VALUE_SELECT
);

    input CLK, RESET;

    input [31:0] ID_PC, ID_REG_DATA1, ID_REG_DATA2, ID_IMMEDIATE, 
                 ID_FREG_DATA1, ID_FREG_DATA2, ID_FREG_DATA3;
    input [4:0] ID_FPU_SELECT, ID_REG_WRITE_ADDR, ID_REG_READ_ADDR1, ID_REG_READ_ADDR2, ID_REG_READ_ADDR3;
    input ID_REG_WRITE_EN, ID_FREG_WRITE_EN, ID_OPERAND1_SELECT, ID_OPERAND2_SELECT,
          ID_DATA_MEM_WRITE_DATA_SELECT;
    input [5:0] ID_ALU_SELECT;
    input [3:0] ID_DATA_MEM_READ, ID_BRANCH_CTRL;
    input [2:0] ID_DATA_MEM_WRITE;
    input [1:0] ID_REG_TYPE, ID_WB_VALUE_SELECT;

    output reg [31:0] EX_PC, EX_REG_DATA1, EX_REG_DATA2, EX_IMMEDIATE,
                      EX_FREG_DATA1, EX_FREG_DATA2, EX_FREG_DATA3;
    output reg [4:0] EX_FPU_SELECT, EX_REG_WRITE_ADDR, EX_REG_READ_ADDR1, EX_REG_READ_ADDR2, EX_REG_READ_ADDR3;
    output reg EX_REG_WRITE_EN, EX_FREG_WRITE_EN, EX_OPERAND1_SELECT, EX_OPERAND2_SELECT,
               EX_DATA_MEM_WRITE_DATA_SELECT;
    output reg [5:0] EX_ALU_SELECT;
    output reg [3:0] EX_DATA_MEM_READ, EX_BRANCH_CTRL;
    output reg [2:0] EX_DATA_MEM_WRITE;
    output reg [1:0] EX_REG_TYPE, EX_WB_VALUE_SELECT;

    always @ (posedge CLK)
    begin
        if (RESET == 1'b1)
        begin
            EX_PC <= #0.1 32'd0;
            EX_REG_DATA1 <= #0.1 32'd0;
            EX_REG_DATA2 <= #0.1 32'd0;
            EX_FREG_DATA1 <= #0.1 32'd0;
            EX_FREG_DATA2 <= #0.1 32'd0;
            EX_FREG_DATA3 <= #0.1 32'd0;
            EX_IMMEDIATE <= #0.1 32'd0;
            EX_REG_WRITE_ADDR <= #0.1 4'd0;
            EX_REG_READ_ADDR1 <= #0.1 4'd0;
            EX_REG_READ_ADDR2 <= #0.1 4'd0;
            EX_REG_READ_ADDR3 <= #0.1 4'd0;
            EX_ALU_SELECT <= #0.1 5'd0;
            EX_OPERAND1_SELECT <= #0.1 1'd0;
            EX_OPERAND2_SELECT <= #0.1 1'd0;
            EX_FPU_SELECT <= #0.1 4'd0;
            EX_REG_TYPE <= #0.1 2'd0;
            EX_REG_WRITE_EN <= #0.1 1'd0;
            EX_FREG_WRITE_EN <= #0.1 1'd0;
            EX_DATA_MEM_WRITE_DATA_SELECT <= #0.1 1'd0;
            EX_DATA_MEM_WRITE <= #0.1 3'd0;
            EX_DATA_MEM_READ <= #0.1 4'd0;
            EX_BRANCH_CTRL <= #0.1 4'd0;
            EX_WB_VALUE_SELECT <= #0.1 2'd0;
        end
        else
        begin
            EX_PC <= #0.1 ID_PC;
            EX_REG_DATA1 <= #0.1 ID_REG_DATA1;
            EX_REG_DATA2 <= #0.1 ID_REG_DATA2;
            EX_FREG_DATA1 <= #0.1 ID_FREG_DATA1;
            EX_FREG_DATA2 <= #0.1 ID_FREG_DATA2;
            EX_FREG_DATA3 <= #0.1 ID_FREG_DATA3;
            EX_IMMEDIATE <= #0.1 ID_IMMEDIATE;
            EX_REG_WRITE_ADDR <= #0.1 ID_REG_WRITE_ADDR;
            EX_REG_READ_ADDR1 <= #0.1 ID_REG_READ_ADDR1;
            EX_REG_READ_ADDR2 <= #0.1 ID_REG_READ_ADDR2;
            EX_REG_READ_ADDR3 <= #0.1 ID_REG_READ_ADDR3;
            EX_ALU_SELECT <= #0.1 ID_ALU_SELECT;
            EX_OPERAND1_SELECT <= #0.1 ID_OPERAND1_SELECT;
            EX_OPERAND2_SELECT <= #0.1 ID_OPERAND2_SELECT;
            EX_FPU_SELECT <= #0.1 ID_FPU_SELECT;
            EX_REG_TYPE <= #0.1 ID_REG_TYPE;
            EX_REG_WRITE_EN <= #0.1 ID_REG_WRITE_EN;
            EX_FREG_WRITE_EN <= #0.1 ID_FREG_WRITE_EN;
            EX_DATA_MEM_WRITE_DATA_SELECT <= #0.1 ID_DATA_MEM_WRITE_DATA_SELECT;
            EX_DATA_MEM_WRITE <= #0.1 ID_DATA_MEM_WRITE;
            EX_DATA_MEM_READ <= #0.1 ID_DATA_MEM_READ;
            EX_BRANCH_CTRL <= #0.1 ID_BRANCH_CTRL;
            EX_WB_VALUE_SELECT <= #0.1 ID_WB_VALUE_SELECT;
        end
    end
    
endmodule