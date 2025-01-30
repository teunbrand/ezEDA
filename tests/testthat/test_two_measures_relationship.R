p <- two_measures_relationship(ggplot2::mpg, displ, hwy, class)

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
  expect_that(length(names(p$data)), equals(11))
})

test_that("x axis is labeled 'displ'",{
  expect_match(labels$x, "displ")
})

test_that("y axis is labeled 'hwy'",{
  expect_match(labels$y, "hwy")
})


