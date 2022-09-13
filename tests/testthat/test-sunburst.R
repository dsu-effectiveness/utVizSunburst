test_data = list()

test_data$data = data.frame(
  person_id = letters[1:12],
  student_type = rep(c("x", "y", "z"), each = 4),
  ipeds_race_ethn = rep(c("A", "B", "C", "D"), times = 3),
  college = rep(c("HU", "LR"), each = 6),
  gpa = c("medium", "low"),
  club = c(TRUE, FALSE, FALSE),
  outcome = c("retained", "graduated", "dropped", "stopped")
)
test_data$steps = c("student_type", "ipeds_race_ethn", "college", "gpa", "club", "outcome")

describe("the sunburst object", {
  it("is an htmlwidget", {
    sb = sunburst(test_data$data, test_data$steps)

    expect_s3_class(sb, "sunburst")
    expect_s3_class(sb, "htmlwidget")
  })

  it("contains a 'data' entry", {
    sb = sunburst(test_data$data, test_data$steps)

    expect_true("data" %in% names(sb$x))
  })

  it("has a 'data' entry that is the 'steps'-defined subset of 'data'", {
    sb = sunburst(test_data$data, test_data$steps)

    expect_equal(sb$x$data, test_data$data[test_data$steps])
  })

  it("has a 'steps' entry that matches the 'steps' argument", {
    sb = sunburst(test_data$data, test_data$steps)

    expect_true("steps" %in% names(sb$x))
    expect_equal(sb$x$steps, test_data$steps)
  })

  it("only allows 'steps' within the colnames of 'data'", {
    expect_error(
      sunburst(data = test_data$data, steps = c("not_a_column", "nor_is_this"))
    )
  })

  it("disallows duplicated 'steps'", {
    expect_error(
      sunburst(data = test_data$data, steps = rep(test_data$steps[1], 2))
    )
  })
})

describe("the sunburst 'palette'", {
  it("is absent if not provided by the user", {
    sb = sunburst(test_data$data, steps = test_data$steps)

    expect_false("palette" %in% names(sb$x))
  })

  it("is present if provided by the user", {
    hex_palette = c("#FFFFFF", "#000000", "#ABCABC")

    sb = sunburst(
      test_data$data,
      steps = test_data$steps,
      palette = hex_palette
    )

    expect_true("palette" %in% names(sb$x))
    expect_equal(sb$x$palette, I(hex_palette))
  })

  it("converts named colors to hex codes", {
    col_palette = c("goldenrod", "whitesmoke", "black")
    hex_palette = c("#DAA520", "#F5F5F5", "#000000")

    sb = sunburst(
      test_data$data,
      steps = test_data$steps,
      palette = col_palette
    )

    expect_equal(sb$x$palette, I(hex_palette))
  })
})
