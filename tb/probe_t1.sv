`timescale 1ns/1ps

module probe_t1;

  logic [7:0] data;
  integer values [0:3];
  integer value_arg;
  integer i;

  task automatic check_equal(
    input integer actual,
    input integer expected
  );
    begin
      if (actual !== expected)
        $fatal(1, "CHECK_FAIL actual=%0d expected=%0d",
               actual, expected);
    end
  endtask

  initial begin
    // 测试 logic
    data = 8'hA5;
    check_equal(data, 165);

    // 测试数组与循环
    for (i = 0; i < 4; i = i + 1)
      values[i] = i * 10;

    check_equal(values[3], 30);

    // 测试运行参数，不传参数时使用默认值
    if (!$value$plusargs("VALUE=%d", value_arg))
      value_arg = 7;

    $display("VALUE=%0d", value_arg);

    // 测试随机数函数能否调用
    data = $urandom;
    $display("RANDOM_BYTE=%0h", data);

    $display("T1_PASS");
    $finish;
  end

endmodule