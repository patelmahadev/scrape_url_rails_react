import axios from "axios";
import React, { useEffect, useState } from "react";

const ShowProduct = () => {
  const [productList, setProductList] = useState([]);
  useEffect(async () => {
    try {
      let res = await axios.get("http://localhost:3000/api/v1/products");
      debugger;
      setProductList(res.data);
    } catch (error) {
      return error.response;
    }
  }, []);
  console.log(123, productList);
  return (
    <div className="product-list">
      <h2>Products List</h2>
      <table id="customers">
        <thead>
          <tr>
            <th>Id</th>
            <th>Image</th>
            <th>Title</th>
            <th>Description</th>
            <th>URL</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
          {productList?.map((item, index) => {
            return (
              <tr>
                <td>{item.id}</td>
                <td><img src={item.product_image} alt="product img" height="200px" width="200px"/></td>
                <td>{item.title}</td>
                <td>{item.description}</td>
                <td>{item.url}</td>
                <td>{item.price}</td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default ShowProduct;
