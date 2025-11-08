def test_post_products_list(api_context):
    """
    Sending POST to /api/productsList
    should return 405 (method is not allowed)
    """

    response = api_context.post("/api/productsList")

    print("Status:", response.status)
    print("Response Body:", response.text())

    assert response.status == 200, f"Expected 200, got {response.status}"

    data = response.json()

    assert data["responseCode"] == 405, f"Unexpected response code: {data['responseCode']}"
    assert data["message"] == "This request method is not supported.", "Unexpected error message"

    print("Test Passed — POST not supported as expected.")