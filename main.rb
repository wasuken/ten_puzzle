require "benchmark"

def ten_puzzle(a, b, c, d, rst)
  numbers = [a, b, c, d]
  operations = [:+, :-, :*, :/]
  # debug = [9999999999999999999999999]
  trace = []

  numbers.permutation.to_a.each do |nums|
    operations.repeated_permutation(3).to_a.each do |ops|
      # アプローチ1
      expression = "(#{nums[0].to_f} #{ops[0]} #{nums[1].to_f}) #{ops[1]} (#{nums[2].to_f} #{ops[2]} #{nums[3].to_f})"

      # 組み立てた式を評価する
      result = eval(expression)

      trace.push([expression, result])
      if result == rst
        return expression + " = #{rst}"
      end
      # アプローチ2
      result = nums[0].to_f.send(ops[0], nums[1].to_f).send(ops[1], nums[2].to_f).send(ops[2], nums[3].to_f)
      calc_form_str = "((#{nums[0]} #{ops[0]} #{nums[1]}) #{ops[1]} #{nums[2]}) #{ops[2]} #{nums[3]} = #{rst}"
      trace.push([calc_form_str, result])
      if result == rst.to_f
        return calc_form_str
      end
    end
  end
  # nil
  # p trace
  nil
end

puts "############### level1 ###############"
Benchmark.bm do |x|
  x.report("1. ten_puzzle: ") {
    puts ten_puzzle(1, 2, 3, 4, 10)
  }
  x.report("2. ten_puzzle: ") {
    puts ten_puzzle(1, 3, 5, 7, 10)
  }
  x.report("3. ten_puzzle: ") {
    puts ten_puzzle(1, 1, 2, 5, 10)
  }
  x.report("4. ten_puzzle: ") {
    puts ten_puzzle(1, 1, 2, 4, 10)
  }
end

puts "############### level2 ###############"
Benchmark.bm do |x|
  x.report("1. ten_puzzle: ") {
    puts ten_puzzle(1, 1, 1, 6, 10)
  }
  x.report("2. ten_puzzle: ") {
    puts ten_puzzle(1, 2, 7, 7, 10)
  }
  x.report("3. ten_puzzle: ") {
    puts ten_puzzle(5, 5, 5, 7, 10)
  }
  x.report("4. ten_puzzle: ") {
    puts ten_puzzle(9, 9, 9, 9, 10)
  }
end

puts "############### level3 ###############"
Benchmark.bm do |x|
  x.report("1. ten_puzzle: ") {
    puts ten_puzzle(1, 3, 3, 7, 10)
  }
  x.report("2. ten_puzzle: ") {
    puts ten_puzzle(1, 1, 9, 9, 10)
  }
  x.report("3. ten_puzzle: ") {
    puts ten_puzzle(1, 1, 5, 8, 10)
  }
  x.report("4. ten_puzzle: ") {
    puts ten_puzzle(3, 4, 7, 8, 10)
  }
end
