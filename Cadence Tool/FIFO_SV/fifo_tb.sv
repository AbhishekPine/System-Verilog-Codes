module fifo_tb;

    logic clk, rst, wr_en, rd_en;
    logic [7:0] data_in, data_out;
    logic full, empty;

    fifo #(8, 8) uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Starting FIFO test");
        clk = 0; rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
        #10 rst = 0;

        // Write data into FIFO
        repeat (5) begin
            @(posedge clk);
            wr_en = 1;
            data_in = $random;
        end
        @(posedge clk);
        wr_en = 0;

        // Read data from FIFO
        repeat (5) begin
            @(posedge clk);
            rd_en = 1;
        end
        @(posedge clk);
        rd_en = 0;

        $finish;
    end

endmodule
