
def test_get_products_list(api_context):
    
    response = api_context.get("/api/productsList")
    assert response.ok, f"Request failed with status {response.status}"
    data = response.json()

    assert "products" in data, "No 'products' key found in response"

    print(f"Total products: {len(data['products'])}")

    for product in data["products"]:
        assert "id" in product, "Product missing 'id'"
        assert "name" in product, "Product missing 'name'"
        assert "price" in product, "Product missing 'price'"
        assert "brand" in product, "Product missing 'brand'"

    print([p["name"] for p in data["products"][:5]])

def test_get_brands_list(api_context):

    response = api_context.get("/api/brandsList")

    assert response.ok, f"Request failed with status {response.status}"

    data = response.json()

    assert "brands" in data, "No 'brands' key found in response"

    print(f"Total brands: {len(data['brands'])}")

    for brand in data["brands"]:
        assert "id" in brand, "Brand missing 'id'"
        assert "brand" in brand, "Brand missing 'brand' name"

    print([b["brand"] for b in data["brands"][:5]])