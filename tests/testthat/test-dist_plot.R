plt1 <- quick_dist(gapminder::gapminder, "lifeExp")
plt2 <- quick_dist(gapminder::gapminder, "continent")

test_that("Testing whether the output for a numeric variable are density and vlines plots and for a categorical, a bar chart.", {

  expect_true(
    "GeomDensity" %in% class(plt1$layers[[1]]$geom) &&
      "GeomVline" %in% class(plt1$layers[[2]]$geom)
  )
  expect_true(
    "GeomBar" %in% class(plt2$layers[[1]]$geom)
  )
})

test_that("Testing whether aesthetic mappings are correct in both type of plots",
          {
            expect_equal(as.character(rlang::get_expr(plt1$mapping$x)), "lifeExp")
            expect_equal(as.character(rlang::get_expr(plt2$mapping$x)), "continent")
          })

test_that("Testing whether the function accept invalid input arguments",
          {
            expect_error(quick_dist("2", 12))
            expect_error(quick_dist(2.3, "lifeExp"))
            expect_error(quick_dist(gapminder::gapminder, 1.23))
            expect_error(quick_dist(gapminder::gapminder, "aaaa"))
            expect_error(quick_dist(gapminder::gapminder, lifeExp))
          })
