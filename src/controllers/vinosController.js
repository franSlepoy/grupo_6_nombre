let db = require("../database/models")
const path = require("path");

let vinosController = {
    list: function(req,res){
       db.Vino.findAll()
       .then(function(vinos){
       res.render(path.resolve(__dirname, "../views/listadoDeVinos"), {vinos:vinos})
       //return  res.json(vinos);
       })
    },
    add: function(req,res){
        res.render("crearVinoForm")
    },
    create: function(req,res){
        db.Vino.create({
            nombre: req.body.nombre, 
            anio: req.body.anio, 
            cepas_idCepa: req.body.cepas_idCepa,
            descripcion: req.body.descripcion,
            imagen: req.body.imagen,
            lineas_idLineas: req.body.lineas_idLineas,
            maridaje_idmaridaje: req.body.maridaje_idmaridaje,
            nombreBodega_idBodega: req.body.nombreBodega_idBodega,
            potencialGuardado: req.body.potencialGuardado,
            precio: req.body.precio,
            volumen: req.body.volumen
        });
         res.redirect(path.resolve(__dirname, "../views/vinos"));
    },
    delete: function(req,res){
        
    },
    detail: function(req,res){
        db.Vino.findByPk(req.params.id)
        .then(function(vinos){
            res.render(path.resolve(__dirname, "../views/detalleVino"), {vinos:vinos})
        })
    },
    edit: (req,res) => {
       db.Vino.findByPk(req.params.id)
       .then(function(vino){
        res.render("editarVinoForm", {vino:vino})
       })
    },
    cepasList: (req,res) =>{
        db.Cepa.findAll()
        .then(function(cepas){
            res.render(path.resolve(__dirname, "../views/listadoPorCepas"), {cepas:cepas})
             //return  res.json({vinos:vinos});
             })
    }

};
module.exports = vinosController