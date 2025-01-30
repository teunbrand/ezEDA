p <- measure_change_over_time_long(ggplot2::economics_long, date, variable, value, pop, unemploy)

labels <- if ("get_labs" %in% getNamespaceExports("ggplot2")) {
  ggplot2::get_labs(p)
} else {
  p$labels
}

test_that("Plot layers match expectations",{
  expect_is(p$layers[[1]], "ggproto")
})

test_that("Plot returns ggplot object",{
  expect_is(p, "ggplot")
})

test_that("Plot uses correct data",{
  expect_equal(TRUE, all(c("date", "variable", "value") %in% names(p$data)))
})
test_that("x axis is labeled 'date'",{
  expect_match(labels$x, "date")
})

test_that("y axis is labeled 'value'",{
  expect_match(labels$y, "value")
})


