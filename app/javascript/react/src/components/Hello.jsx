import React from "react";
import { ToastContainer} from 'react-toastify';
  import 'react-toastify/dist/ReactToastify.css';
import {
	BrowserRouter,
	Routes,
	Route
} from "react-router-dom";
import ProductForm from './productForm';
import ShowProduct from './showProduct';

import "./app.css"


function App() {
	return (
		<>
		<ToastContainer />
			<BrowserRouter>
				<Routes>
					<Route path="/" element={<ProductForm />}></Route>
					<Route path="/show-product" element={<ShowProduct />}></Route>
			</Routes>
			</BrowserRouter>
		</>
	);
}

export default App;