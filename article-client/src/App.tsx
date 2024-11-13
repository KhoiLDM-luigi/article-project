import { Route, Routes } from "react-router-dom";
import Template from "./components/Template";
import OAuthCallback from "./components/oauth/OAuthCallback";
import Article from "./components/article/Article";
import ArticleDetail from "./components/article/ArticleDetail";
import ArticleEdit from "./components/article/ArticleEdit";
import ArticleAdd from "./components/article/ArticleAdd";

function App() {
  return (
    <Template>
      <Routes>
        <Route path="" element={<Article />} />
        <Route path="/login/oauth2/code/spring" element={<OAuthCallback />} />
        <Route path="articles" element={<Article />} />
        <Route path="articles/view/:id" element={<ArticleDetail />} />
        <Route path="articles/edit/:id" element={<ArticleEdit />} />
        <Route path="articles/add" element={<ArticleAdd />} />
      </Routes>
    </Template>
  )
}

export default App
