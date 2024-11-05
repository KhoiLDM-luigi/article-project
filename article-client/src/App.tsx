import { Route, Routes } from "react-router-dom";
import Template from "./components/Template";
import OAuthCallback from "./components/oauth/OAuthCallback";
import Article from "./components/article/Article";

function App() {
  return (
    <Template>
      <Routes>
        <Route path="" element={<Article />} />
        <Route path="/login/oauth2/code/spring" element={<OAuthCallback />} />
      </Routes>
    </Template>
  )
}

export default App
