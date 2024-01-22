require "benchmark"

def ten_puzzle(a, b, c, d, rst)
  numbers = [a, b, c, d]
  operations = [:+, :-, :*, :/]

  numbers.permutation.to_a.each do |nums|
    operations.repeated_permutation(3).to_a.each do |ops|
      result = nums[0].to_f.send(ops[0], nums[1]).send(ops[1], nums[2]).send(ops[2], nums[3])
      if result == rst
        return "#{nums[0]} #{ops[0]} #{nums[1]} #{ops[1]} #{nums[2]} #{ops[2]} #{nums[3]} = #{rst}"
      end
    end
  end

  "No solution found"
end

Benchmark.bm do |x|
  x.report("1. ten_puzzle: 1, 2, 3, 4=") {
    puts ten_puzzle(1, 2, 3, 4, 10)
  }
  x.report("2. ten_puzzle: 1, 3, 5, 7=") {
    puts ten_puzzle(1, 3, 5, 7, 10)
  }
  x.report("3. ten_puzzle: 1, 1, 2, 5=") {
    puts ten_puzzle(1, 1, 2, 5, 10)
  }
  x.report("4. ten_puzzle: 1, 1, 2, 4=") {
    puts ten_puzzle(1, 1, 2, 4, 10)
  }
  x.report("5. ten_puzzle: 1, 1, 1, 6=") {
    puts ten_puzzle(1, 1, 1, 6, 10)
  }
  x.report("6. ten_puzzle: 1, 2, 7, 7=") {
    puts ten_puzzle(1, 2, 7, 7, 10)
  }
  x.report("7. ten_puzzle: 5, 5, 5, 7=") {
    puts ten_puzzle(5, 5, 5, 7, 10)
  }
  x.report("8. ten_puzzle: 9, 9, 9, 9=") {
    puts ten_puzzle(9, 9, 9, 9, 10)
  }
end
