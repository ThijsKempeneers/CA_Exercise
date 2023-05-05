module forwarding_unit(Rs1_ID_EX, Rs2_ID_EX, RegRd_EX_MEM, RegWrite_EX_MEM, RegWrite_MEM_WB, RegRd_MEM_WB, ForwardA, ForwardB);

input[4:0] Rs1_ID_EX, Rs2_ID_EX, RegRd_EX_MEM, RegRd_MEM_WB;
input RegWrite_EX_MEM, RegWrite_MEM_WB;
output reg[1:0] ForwardA, ForwardB;

always @(Rs1_ID_EX, RegRd_EX_MEM, RegWrite_EX_MEM, RegWrite_MEM_WB, RegRd_MEM_WB)
    begin
        if (RegWrite_EX_MEM && (RegRd_EX_MEM != 0) && (RegRd_EX_MEM == Rs1_ID_EX))
            begin
                ForwardA = 2'b10;
            end
        // else if (RegWrite_MEM_WB && (RegRd_MEM_WB != 0) && (RegRd_MEM_WB == Rs1_ID_EX))
        //     begin
        //         ForwardA = 2'b01;
        //     end
        else if (RegWrite_MEM_WB && (RegRd_MEM_WB != 0) && !(RegWrite_EX_MEM && (RegRd_EX_MEM != 0) && (RegRd_EX_MEM == Rs1_ID_EX)))
            begin
                ForwardA = 2'b10;
            end
        else 
            begin
                ForwardA = 2'b00;
            end
	end

always @(Rs2_ID_EX, RegRd_EX_MEM, RegWrite_EX_MEM, RegWrite_MEM_WB, RegRd_MEM_WB)
    begin
        if (RegWrite_EX_MEM && (RegRd_EX_MEM != 0) && (RegRd_EX_MEM == Rs2_ID_EX))
            begin
                ForwardB = 2'b10;
            end
        // else if (RegWrite_MEM_WB && (RegRd_MEM_WB != 0) && (RegRd_MEM_WB == Rs2_ID_EX))
        //     begin
        //         ForwardB = 2'b01;
        //     end
        else if (RegWrite_MEM_WB && (RegRd_MEM_WB != 0) && !(RegWrite_EX_MEM && (RegRd_EX_MEM != 0) && (RegRd_EX_MEM == Rs2_ID_EX)))
            begin
                ForwardA = 2'b10;
            end
        else 
            begin
                ForwardB = 2'b00;
            end
    end

endmodule
