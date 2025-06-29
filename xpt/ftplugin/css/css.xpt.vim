XPTemplate priority=personal

XPT grid
.main-grid { 
    height: calc(100vh - 5.6em);
    padding: 2px;
    line-height: 2.2rem;
    display: grid;
    grid-template-columns:  100%;
    grid-template-rows:   auto 1fr auto;
    grid-gap: 0;
    grid-template-areas: "header" "main" "footer";
}

.main-grid > header { 
    grid-area: header;  
    border: solid 1px #ccc;
    border-bottom: none;
    border-top-right-radius: 4px;
    border-top-left-radius: 4px;
    padding: 4px 8px 4px 15px;
    margin: 0;
    background-color: #f3f3f3;
}

.main-grid > main   { grid-area: main;    padding: 0; }
.main-grid > footer { 
    grid-area: footer;  
    background-color: #ddd;
    border: solid 1px #ccc;
    border-top: none;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
    padding: 1px 8px;
    line-height: 1.6em;
    margin: 0;
}

