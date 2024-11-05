import Content from "./Content";
import Footer from "./Footer";
import Header from "./Header";

export default function Template(props: any) {
    return (
        <>
            <Header />
            <Content>{props.children}</Content>
            <Footer />
        </>
    )
}