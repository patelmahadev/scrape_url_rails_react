import React, { useState } from "react";
import "./app.css";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
const ProductForm = () => {
  const [url, setUrl] = useState(""); // Provide an initial value here
  const [data, setData] = useState([]);
  const navigate = useNavigate();

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await axios.post(
        `http://localhost:3000/api/v1/products?url=${url}`
      );
      setData(response.data);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
    setUrl("");
    toast.success("Data created successfully");
  };

  const handleList = () => {
    navigate("/show-product");
  };

  return (
    <>
      <div className="home_page">
        <div className="show_list_button">
        <button className="list_btn" onClick={handleList}>List of Products</button>
        </div>
        <div className="centered_container">
          <div className="category_url_form">
            <form onSubmit={handleSubmit}>
              <div className="form_field">
                <input
                  type="text"
                  placeholder="Enter Url"
                  value={url}
                  onChange={(e) => setUrl(e.target.value)}
                />
              </div>
              <div className="form_field">
                <button type="submit">Submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductForm;
