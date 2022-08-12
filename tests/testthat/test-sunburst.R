describe("the sunburst function", {
  it("creates a sunburst/htmlwidget object", {
    sb = sunburst("some data")

    expect_s3_class(sb, "sunburst")
    expect_s3_class(sb, "htmlwidget")
  })
})
