document.addEventListener('DOMContentLoaded', () => {
    
    const baseDeDatos = [
        {
            id: 1,
            nombre: 'Guantes Para Pesas Gimnasio Gym Deporte Con Muñequera Hombre',
            precio:  38900,
            imagen: 'https://http2.mlstatic.com/D_NQ_NP_841753-MCO48027708644_102021-V.webp'
        },
        {
            id: 2,
            nombre: 'Accesorio Deportivo - Reusable Gym Water Bottle Fitness Sport',
            precio: 138000,
            imagen: 'https://http2.mlstatic.com/D_NQ_NP_747013-MCO47345424203_092021-V.webp'
        },
        {
            id: 3,
            nombre: 'Banco Pesas Abdominales Sportfitness Mancuernas Plegable Gym',
            precio: 380000,
            imagen: 'https://http2.mlstatic.com/D_NQ_NP_801301-MCO31001431814_062019-O.webp'
        },
        {
            id: 4,
            nombre: 'Acido Arachidonic',
            precio:  120000,
            imagen: "../img/acido.webp"
        },
        {
            id: 5,
            nombre: 'BiPro 2LB',
            precio: 130000,
            imagen: "../img/bipro.webp"
        },
        {
            id: 6,
            nombre: 'Breach Aminoacidos',
            precio: 110000,
            imagen: "../img/breach.webp"
        },
       
    ];

    let carrito = [];
    const divisa = 'COP';
    const DOMitems = document.querySelector('#items');
    const DOMcarrito = document.querySelector('#carrito');
    const DOMtotal = document.querySelector('#total');
    const DOMbotonVaciar = document.querySelector('#boton-vaciar');

    function renderizarProductos() {
        baseDeDatos.forEach((info) => {
            
            const miNodo = document.createElement('div');
            miNodo.classList.add('card', 'col-sm-4');
            
            const miNodoCardBody = document.createElement('div');
            miNodoCardBody.classList.add('card-body');
            
            const miNodoTitle = document.createElement('h5');
            miNodoTitle.classList.add('card-title');
            miNodoTitle.textContent = info.nombre;
            
            const miNodoImagen = document.createElement('img');
            miNodoImagen.classList.add('img-fluid');
            miNodoImagen.setAttribute('src', info.imagen);
            
            const miNodoPrecio = document.createElement('p');
            miNodoPrecio.classList.add('card-text');
            miNodoPrecio.textContent = `${info.precio}${divisa}`;
             
            const miNodoBoton = document.createElement('button');
            miNodoBoton.classList.add('btn', 'btn-primary');
            miNodoBoton.textContent = '+';
            miNodoBoton.setAttribute('marcador', info.id);
            miNodoBoton.addEventListener('click', anyadirProductoAlCarrito);
            
            miNodoCardBody.appendChild(miNodoImagen);
            miNodoCardBody.appendChild(miNodoTitle);
            miNodoCardBody.appendChild(miNodoPrecio);
            miNodoCardBody.appendChild(miNodoBoton);
            miNodo.appendChild(miNodoCardBody);
            DOMitems.appendChild(miNodo);
        });
    }

    
    function anyadirProductoAlCarrito(evento) {
        
        carrito.push(evento.target.getAttribute('marcador'))
         
        renderizarCarrito();

    }

    
    function renderizarCarrito() {
        
        DOMcarrito.textContent = '';
        
        const carritoSinDuplicados = [...new Set(carrito)];
        
        carritoSinDuplicados.forEach((item) => {
            
            const miItem = baseDeDatos.filter((itemBaseDatos) => {
            
                return itemBaseDatos.id === parseInt(item);
            });
            
            const numeroUnidadesItem = carrito.reduce((total, itemId) => {
                
                return itemId === item ? total += 1 : total;
            }, 0);
            
            const miNodo = document.createElement('li');
            miNodo.classList.add('list-group-item', 'text-right', 'mx-2');
            miNodo.textContent = `${numeroUnidadesItem} x ${miItem[0].nombre} - ${miItem[0].precio}${divisa}`;
            
            const miBoton = document.createElement('button');
            miBoton.classList.add('btn', 'btn-danger', 'mx-5');
            miBoton.textContent = 'X';
            miBoton.style.marginLeft = '1rem';
            miBoton.dataset.item = item;
            miBoton.addEventListener('click', borrarItemCarrito);
            
            miNodo.appendChild(miBoton);
            DOMcarrito.appendChild(miNodo);
        });
       
       DOMtotal.textContent = calcularTotal();
    }

    
    
    function borrarItemCarrito(evento) {
        
        const id = evento.target.dataset.item;
        
        carrito = carrito.filter((carritoId) => {
            return carritoId !== id;
        });
        
        renderizarCarrito();
    }

    function calcularTotal() {
         
        return carrito.reduce((total, item) => {
            
            const miItem = baseDeDatos.filter((itemBaseDatos) => {
                return itemBaseDatos.id === parseInt(item);
            });
            
            return total + miItem[0].precio;
        }, 0).toFixed(0);
    }

    
    function vaciarCarrito() {
        
        carrito = [];
        
        renderizarCarrito();
    }

    
    DOMbotonVaciar.addEventListener('click', vaciarCarrito);

    
    renderizarProductos();
    renderizarCarrito();
  });