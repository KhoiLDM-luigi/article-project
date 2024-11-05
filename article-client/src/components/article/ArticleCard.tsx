export default function ArticleCard(props: any){
    const { by, title, content } = props;
    return (
        <div className="article-card m-2 border p-1">
            <div className="article-title mt-0 mb-2 border-bottom px-1 pt-1">
            <p className="text-primary">{title} <span className="text-info"> by {by}</span></p>
            </div>
            <div className="text-secondary overflow-hidden" style={{ height: "3.5rem" }} dangerouslySetInnerHTML={{ __html: content}} />
        </div>
    )
}