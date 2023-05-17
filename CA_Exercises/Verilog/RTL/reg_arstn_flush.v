// Configurable register for variable width with enable

module reg_arstn_flush#(
parameter integer DATA_W     = 32,
parameter integer PRESET_VAL = 0
   )(
      input                  clk,
      input                  arst_n,
      input                  en,
      input  [ DATA_W-1:0]   din,
      input  wire            flush,
      output [ DATA_W-1:0]   dout
);

reg [DATA_W-1:0] r,nxt;

always@(posedge clk, negedge arst_n)begin
   if(arst_n==0)begin
      r <= PRESET_VAL;
   end else begin
      r <= nxt;
   end
end

always@(*) begin
   if (flush == 1'b1) begin
      nxt = 32'd0;
   end else begin
      if(en == 1'b1)begin
         nxt = din;
      end else begin
         nxt = r;
      end
   end
end

assign dout = r;

endmodule
