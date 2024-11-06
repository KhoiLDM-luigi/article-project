import Account from "./account/Account";

export default function Header() {
    return (
        <div className="bg-secondary position-sticky top-0 w-100 p-2">
            <h1>Article Page</h1>
            <Account />
        </div>

    )
}