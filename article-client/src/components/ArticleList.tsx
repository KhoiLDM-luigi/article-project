import { useEffect, useState } from "react"
import ArticleCard from "./ArticleCard"
import axios from "axios";
import Spinner from 'react-bootstrap/Spinner';

export default function ArticleList() {
    const [ loading, setLoading ] = useState(true)
    const [ error, setError ] = useState(false)
    const [ articleList, setArticleList ] = useState<any>([]);

    const fetchData = async () => {
        try {
            const response = await axios.get("http://127.0.0.1:8082/articles")
            if (response.status == axios.HttpStatusCode.Ok) {
               setArticleList(response.data.articles)
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
            <div><h1>Something when wrong</h1></div>
        )
    }

    return (
        <div className="article-list"> 
            {loading ? <Spinner animation="border" variant="dark" /> :
               articleList.map((item: any, num: any) => (<ArticleCard key={num} by={item.by} title={item.title} content={item.content} />))
            }
        </div>
    )
}