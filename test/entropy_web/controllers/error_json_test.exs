defmodule EntropyWeb.ErrorJSONTest do
  use EntropyWeb.ConnCase, async: true

  test "renders 404" do
    assert EntropyWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert EntropyWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
