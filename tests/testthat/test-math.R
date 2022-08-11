# This file was added to ensure that rcmd-check passed even before any features were added to the
# package.
#
# It should be removed when non-trivial content is added to the package.

describe("multiplication", {
  it("works", {
    expect_equal(2 * 2, 4)
  })
})
