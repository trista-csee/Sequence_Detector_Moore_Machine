`timescale 1ns / 1ps

module sequence_detector_Moore_tb;
    // Inputs
    reg clock;
    reg reset;
    reg sequence_in;
    
    // Outputs
    wire detector_out;
    
    // Instantiate the Sequence Detector using Moore FSM
    sequence_detector_Moore inst ( 
        .clock(clock), 
        .reset(reset),
        .sequence_in(sequence_in),
        .detector_out(detector_out)
    );
    
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // generate clock time period = 10ns (frequency = 100MHz)
    end 
    
    initial begin
        // Initialize Inputs
        sequence_in = 0;
        reset = 1;
        
        // Wait 100ns for global reset to finish
        #30;
        reset = 0;
        
        #40;
        sequence_in = 1;
        
        #10;
        sequence_in = 0;
        
        #10;
        sequence_in = 1; 
        
        #20;
        sequence_in = 0; 
        
        #20;
        sequence_in = 1; 
        
        #20;
        sequence_in = 0;  
    end
      
endmodule