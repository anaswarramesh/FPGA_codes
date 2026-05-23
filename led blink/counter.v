module count(
    input clk,
    input btn1,
    input btn2,
    output reg [5:0] leds
 );
 
 reg [24:0] counter = 0;
 
 always @(posedge clk)
 begin
     counter <= counter + 1;
 
     // OFF by default
     leds[0] <= 1;
     leds[1] <= 1;
     leds[2] <= 1;
 
     // buttons are ACTIVE LOW
     if(~btn1 && btn2)
     begin
         leds[0] <= ~counter[24];
     end
 
     else if(btn1 && ~btn2)
     begin
         leds[1] <= ~counter[24];
     end
 
     else if(~btn1 && ~btn2)
     begin
         leds[2] <= ~counter[24];
     end
 end
 
 endmodule
