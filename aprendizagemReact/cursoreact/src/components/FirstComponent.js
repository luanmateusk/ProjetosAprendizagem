import AnotherComponent from "./AnotherComponent";


function FirstComponent() {
    return (
        <div className="firstcomponent">
            <p>Primeiro Componente</p>
            {2+3}
            <AnotherComponent/>
        </div> 
    );
}

export default FirstComponent