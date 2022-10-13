module full_adder_tb;

reg  ain, bin, cin;
wire sumout, cout;

full_adder u_full_adder(
    .a_in(ain),
	.b_in(bin),
	.c_in(cin),
	.sum_out(sumout),
	.c_out(cout)
);

//task2: clk and rst generator
parameter  CLK_PERIOD = 20;

reg clk, reset_n;

initial begin
        clk = 0;
    forever begin
        #CLK_PERIOD clk = ~clk;                
    end
end

initial begin
    reset_n = 0;
    #100 
    reset_n = 1;
end

//task3: driver the simulus and capture the response
initial begin
#110 ain = 0; bin = 0; cin = 0; //00
#20  ain = 0; bin = 1; cin = 0; //01
#20  ain = 1; bin = 0; cin = 0; //01
#20  ain = 1; bin = 1; cin = 0; //10
#20  ain = 0; bin = 0; cin = 1; //01
#20  ain = 0; bin = 1; cin = 1; //10
#20  ain = 1; bin = 0; cin = 1; //10
#20  ain = 1; bin = 1; cin = 1; //11
#50 $finish;
end

//task4: check the result
always @(posedge clk) begin
 if(!reset_n)begin
     $display("%t:%m resetting ...",$time);//counter 5 clock
 end else begin
     $display("%t:%m resetting finish",$time);//the 6th clock
 end
end

initial begin
#115 if({cout,sumout}!=2'b00) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
#20  if({cout,sumout}!=2'b01) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
#20  if({cout,sumout}!=2'b01) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
#20  if({cout,sumout}!=2'b10) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
#20  if({cout,sumout}!=2'b01) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
#20  if({cout,sumout}!=2'b10) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
#20  if({cout,sumout}!=2'b10) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
#20  if({cout,sumout}!=2'b11) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
// #20  if({cout,sumout}!=2'b00) $display("Error:{cout,sumout}=%b, ain=%b, bin=%b, cin=%b",{cout,sumout}, ain, bin, cin);
end

//taks5: dump waveform with the compile otion -debug_all
initial begin
    $vcdpluson;
end

endmodule