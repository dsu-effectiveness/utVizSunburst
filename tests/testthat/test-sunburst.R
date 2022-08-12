test_data = data.frame(
  person_id = letters[1:12],
  student_type = rep(c("x", "y", "z"), each = 4),
  ipeds_race_ethn = rep(c("A", "B", "C", "D"), times = 3),
  college = rep(c("HU", "LR"), each = 6),
  gpa = c("medium", "low"),
  club = c(TRUE, FALSE, FALSE),
  outcome = c("retained", "graduated", "dropped", "stopped")
)

describe("the sunburst object", {
  it("is an htmlwidget", {
    sb = sunburst(test_data)

    expect_s3_class(sb, "sunburst")
    expect_s3_class(sb, "htmlwidget")
  })

  it("contains a 'data' entry", {
    sb = sunburst(data = test_data)

    expect_true("data" %in% names(sb$x))
  })

  it("has a 'data' entry that matches the input to sunburst()", {
    sb = sunburst(data = test_data)

    expect_equal(sb$x$data, test_data)
  })

  it("has a 'steps' entry", {
    sb = sunburst(data = test_data)

    expect_true("steps" %in% names(sb$x))
  })
})
