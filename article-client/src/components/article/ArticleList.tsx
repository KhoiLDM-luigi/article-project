import { useEffect, useState } from "react"
import ArticleCard from "./ArticleCard"
import axios from "axios";
import Spinner from 'react-bootstrap/Spinner';
import { Link } from "react-router-dom";

export default function ArticleList() {
    const [ loading, setLoading ] = useState(true)
    const [ error, setError ] = useState(false)
    const [ articleList, setArticleList ] = useState<any>([]);

    const fetchData = async () => {
        try {
            const response = await axios.get("http://127.0.0.1:8082/articles")
            if (response.status == axios.HttpStatusCode.Ok) {
               setArticleList(response.data._embedded.articleDTOList)
               setLoading(false)
            }
            else {
                setError(true)
            }
        }
        catch(e) {
            console.log(e)
            setError(true)
        }
    };

    useEffect(() => {
        console.log("fetching...")
        fetchData();
    }, []);

    if (error) {
        return (
            <div><p className="text-danger">Something when wrong</p></div>
        )
    }

    return (
        <div>
            <div>
                <Link to="/articles/add" className="btn btn-primary">New article</Link>
            </div>
            <div className="article-list"> 
            {loading ? <Spinner animation="border" variant="dark" /> :
               articleList.map((item: any, num: any) => (<ArticleCard key={num} data={item} />))
            }
        </div>
        </div>
      
    )
}