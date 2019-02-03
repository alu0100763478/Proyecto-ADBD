CREATE FUNCTION gasto() RETURNS trigger AS $gasto$
  BEGIN
      IF NOT EXISTS (SELECT * FROM genera WHERE idfactura_g=NEW.idfactura_g) THEN
        UPDATE Obra SET gasto=Obra.gasto+(SELECT Importe FROM factura WHERE idfactura=NEW.idfactura_g) WHERE Obra.idObra=NEW.idobra_g;
        RAISE NOTICE 'Gasto aumentado';
      ELSE
        RAISE NOTICE 'Gasto intacto';
      END IF;
      RETURN NULL;
  END;
$gasto$ LANGUAGE plpgsql;

CREATE TRIGGER gasto BEFORE INSERT ON genera
  FOR EACH ROW EXECUTE PROCEDURE gasto();

CREATE FUNCTION tarea() RETURNS trigger AS $tarea$
  BEGIN
      IF NOT EXISTS (SELECT * FROM Empelado_Tarea_Cursa WHERE DNI_E=NEW.DNI_E AND idTareas_E=NEW.idTareas) THEN
        RAISE EXCEPTION 'Empleado no apto';
      ELSE
        RAISE NOTICE 'Empleado apto';
        RETURN NEW;
      END IF;
      RETURN NULL;
  END;
$tarea$ LANGUAGE plpgsql;

CREATE TRIGGER tarea BEFORE INSERT ON tareas
  FOR EACH ROW EXECUTE PROCEDURE tarea();
