import MDEditor from "@uiw/react-md-editor"
import axios from "axios"
import { useEffect, useState } from "react"
import Spinner from "react-bootstrap/esm/Spinner"
import { Link, useParams } from "react-router-dom"

export default function ArticleDetail() {
    const { id } = useParams()

    const [ data, setData ] = useState({title: "", by: "", content: ""})
    const [ loading, setLoading ] = useState(true)
    const [ error, setError ] = useState(false)

    const fetchResource = async (id: any) => {
        try{
            const response = await axios.get(`http://127.0.0.1:8082/articles/${id}`)   
            setData(response.data)
            setLoading(false)
        }
        catch(e) {
            console.log(e)
            setError(true)
        }
    }

    useEffect(() => {fetchResource(id)}, [])

    if (error) {
        return (
            <div><p className="text-danger">Something when wrong</p></div>
        )
    }
    
    let edit = `/articles/edit/${id}`

    return (
        <div> 
            {loading ? <Spinner animation="border" variant="dark" /> :
                <div> 
                    <Link to={edit} className="btn btn-primary">Edit</Link>
                    <div className="mx-3 mb-2 p-1 border-bottom"> 
                        <h1>{data.title}</h1>
                        <p>By {data.by}</p>
                    </div>
                    <MDEditor.Markdown source={data.content} style={{ whiteSpace: "pre-wrap" }} className="content mx-2 p-2"/>
                </div>
            }
        </div>
    )
}