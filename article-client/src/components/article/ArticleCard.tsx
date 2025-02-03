import MDEditor from "@uiw/react-md-editor";
import { Link } from "react-router-dom";

export default function ArticleCard(props: any){
    const { by, title, content, _links } = props.data;
    return (
        <Link to={_links.self.href.replace("8082/articles", "articles/view")} style={{textDecoration: "none"}}>
            <div className="article-card m-2 border p-1">
                <div className="article-title mt-0 mb-2 border-bottom px-1 pt-1">
                <p className="text-primary">{title} <span className="text-info"> by {by}</span></p>
                </div>

                <MDEditor.Markdown source={content}  style={{ height: "3.5rem" }} className="content text-secondary overflow-hidden mx-2 p-1"/>
            </div>
        </Link>
    )
}