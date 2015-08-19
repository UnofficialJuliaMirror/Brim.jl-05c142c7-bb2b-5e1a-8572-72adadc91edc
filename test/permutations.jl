module TestPermutation
  using Base.Test
  using Brim

  # Test utility functions

  c1 = [1 0; 0 1]
  c2 = [0 1; 1 0]
  c3 = [0 0; 1 1]

  @test Brim.swapable(c1) == true
  @test Brim.swapable(c2) == true
  @test Brim.swapable(c3) == false
  @test Brim.constrained_swap(c1) == c2
  @test Brim.constrained_swap(c2) == c1

  @test Brim.no_empty_rows(c3) == false
  @test Brim.no_empty_rows(c1) == true
  @test Brim.no_empty_columns(c3') == false
  @test Brim.no_empty_columns(c1') == true

  @test Brim.same_row_marginals(c1, c2) == true
  @test Brim.same_row_marginals(c1, c1) == true
  @test Brim.same_row_marginals(c1, c3) == false

  A = map((x) -> x<0.2?1:0, rand(10, 10))

  # null_preserve_marginals
  @test sum(A) == sum(null_preserve_marginals(A))
  @test sum(A) == sum(null_preserve_marginals(A))
  @test sum(A) == sum(null_preserve_marginals(A))

  # null_preserve_rows_marginals
  @test sum(A, 2) == sum(null_preserve_rows_marginals(A), 2)
  @test sum(A, 2) == sum(null_preserve_rows_marginals(A), 2)
  @test sum(A, 2) == sum(null_preserve_rows_marginals(A), 2)

  # null_preserve_columns_marginals
  @test sum(A, 1) == sum(null_preserve_rows_marginals(A), 1)
  @test sum(A, 1) == sum(null_preserve_rows_marginals(A), 1)
  @test sum(A, 1) == sum(null_preserve_rows_marginals(A), 1)

end
