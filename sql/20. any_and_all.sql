-- ============================================================================
-- Uso de ANY and ALL en SQL
-- ============================================================================

-- ============================================================================
-- ¿Qué hacen ANY y ALL?
-- ============================================================================
-- ANY devuelve TRUE si la condición es verdadera para AL MENOS UN valor del subquery.
-- ALL devuelve TRUE solo si la condición es verdadera para TODOS los valores del subquery.

-- Sintaxis común:
-- SELECT ... FROM tabla
-- WHERE columna operador ANY (subconsulta);
-- SELECT ... FROM tabla
-- WHERE columna operador ALL (subconsulta);