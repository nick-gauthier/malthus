#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern void adaptive_capacity_initmod_desolve(void *);
extern void adaptive_capacity_output_dde(void *);
extern void adaptive_capacity_rhs_dde(void *);
extern void adaptive_capacity_rhs_desolve(void *);
extern void brander_taylor_initmod_desolve(void *);
extern void brander_taylor_rhs_dde(void *);
extern void brander_taylor_rhs_desolve(void *);
extern void elite_extraction_initmod_desolve(void *);
extern void elite_extraction_rhs_dde(void *);
extern void elite_extraction_rhs_desolve(void *);
extern void fiscal_demographic_class_initmod_desolve(void *);
extern void fiscal_demographic_class_rhs_dde(void *);
extern void fiscal_demographic_class_rhs_desolve(void *);
extern void fiscal_demographic_initmod_desolve(void *);
extern void fiscal_demographic_rhs_dde(void *);
extern void fiscal_demographic_rhs_desolve(void *);
extern void fiscal_demographic_war_initmod_desolve(void *);
extern void fiscal_demographic_war_rhs_dde(void *);
extern void fiscal_demographic_war_rhs_desolve(void *);
extern void janssen_rhs_dde(void *);
extern void janssen_stochastic_rhs_dde(void *);
extern void nefedov_initmod_desolve(void *);
extern void nefedov_rhs_dde(void *);
extern void nefedov_rhs_desolve(void *);
extern void scaling_cities_initmod_desolve(void *);
extern void scaling_cities_rhs_dde(void *);
extern void scaling_cities_rhs_desolve(void *);
extern void stateless_war_initmod_desolve(void *);
extern void stateless_war_rhs_dde(void *);
extern void stateless_war_rhs_desolve(void *);

/* .Call calls */
extern SEXP adaptive_capacity_contents(SEXP);
extern SEXP adaptive_capacity_create(SEXP);
extern SEXP adaptive_capacity_initial_conditions(SEXP, SEXP);
extern SEXP adaptive_capacity_metadata(SEXP);
extern SEXP adaptive_capacity_rhs_r(SEXP, SEXP, SEXP);
extern SEXP adaptive_capacity_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP adaptive_capacity_set_user(SEXP, SEXP);
extern SEXP brander_taylor_contents(SEXP);
extern SEXP brander_taylor_create(SEXP);
extern SEXP brander_taylor_initial_conditions(SEXP, SEXP);
extern SEXP brander_taylor_metadata(SEXP);
extern SEXP brander_taylor_rhs_r(SEXP, SEXP, SEXP);
extern SEXP brander_taylor_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP brander_taylor_set_user(SEXP, SEXP);
extern SEXP elite_extraction_contents(SEXP);
extern SEXP elite_extraction_create(SEXP);
extern SEXP elite_extraction_initial_conditions(SEXP, SEXP);
extern SEXP elite_extraction_metadata(SEXP);
extern SEXP elite_extraction_rhs_r(SEXP, SEXP, SEXP);
extern SEXP elite_extraction_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP elite_extraction_set_user(SEXP, SEXP);
extern SEXP fiscal_demographic_class_contents(SEXP);
extern SEXP fiscal_demographic_class_create(SEXP);
extern SEXP fiscal_demographic_class_initial_conditions(SEXP, SEXP);
extern SEXP fiscal_demographic_class_metadata(SEXP);
extern SEXP fiscal_demographic_class_rhs_r(SEXP, SEXP, SEXP);
extern SEXP fiscal_demographic_class_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP fiscal_demographic_class_set_user(SEXP, SEXP);
extern SEXP fiscal_demographic_contents(SEXP);
extern SEXP fiscal_demographic_create(SEXP);
extern SEXP fiscal_demographic_initial_conditions(SEXP, SEXP);
extern SEXP fiscal_demographic_metadata(SEXP);
extern SEXP fiscal_demographic_rhs_r(SEXP, SEXP, SEXP);
extern SEXP fiscal_demographic_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP fiscal_demographic_set_user(SEXP, SEXP);
extern SEXP fiscal_demographic_war_contents(SEXP);
extern SEXP fiscal_demographic_war_create(SEXP);
extern SEXP fiscal_demographic_war_initial_conditions(SEXP, SEXP);
extern SEXP fiscal_demographic_war_metadata(SEXP);
extern SEXP fiscal_demographic_war_rhs_r(SEXP, SEXP, SEXP);
extern SEXP fiscal_demographic_war_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP fiscal_demographic_war_set_user(SEXP, SEXP);
extern SEXP janssen_contents(SEXP);
extern SEXP janssen_create(SEXP);
extern SEXP janssen_initial_conditions(SEXP, SEXP);
extern SEXP janssen_metadata(SEXP);
extern SEXP janssen_rhs_r(SEXP, SEXP, SEXP);
extern SEXP janssen_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP janssen_set_user(SEXP, SEXP);
extern SEXP janssen_stochastic_contents(SEXP);
extern SEXP janssen_stochastic_create(SEXP);
extern SEXP janssen_stochastic_initial_conditions(SEXP, SEXP);
extern SEXP janssen_stochastic_metadata(SEXP);
extern SEXP janssen_stochastic_rhs_r(SEXP, SEXP, SEXP);
extern SEXP janssen_stochastic_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP janssen_stochastic_set_user(SEXP, SEXP);
extern SEXP nefedov_contents(SEXP);
extern SEXP nefedov_create(SEXP);
extern SEXP nefedov_initial_conditions(SEXP, SEXP);
extern SEXP nefedov_metadata(SEXP);
extern SEXP nefedov_rhs_r(SEXP, SEXP, SEXP);
extern SEXP nefedov_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP nefedov_set_user(SEXP, SEXP);
extern SEXP scaling_cities_contents(SEXP);
extern SEXP scaling_cities_create(SEXP);
extern SEXP scaling_cities_initial_conditions(SEXP, SEXP);
extern SEXP scaling_cities_metadata(SEXP);
extern SEXP scaling_cities_rhs_r(SEXP, SEXP, SEXP);
extern SEXP scaling_cities_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP scaling_cities_set_user(SEXP, SEXP);
extern SEXP stateless_war_contents(SEXP);
extern SEXP stateless_war_create(SEXP);
extern SEXP stateless_war_initial_conditions(SEXP, SEXP);
extern SEXP stateless_war_metadata(SEXP);
extern SEXP stateless_war_rhs_r(SEXP, SEXP, SEXP);
extern SEXP stateless_war_set_initial(SEXP, SEXP, SEXP, SEXP);
extern SEXP stateless_war_set_user(SEXP, SEXP);

static const R_CMethodDef CEntries[] = {
    {"adaptive_capacity_initmod_desolve",        (DL_FUNC) &adaptive_capacity_initmod_desolve,        1},
    {"adaptive_capacity_output_dde",             (DL_FUNC) &adaptive_capacity_output_dde,             1},
    {"adaptive_capacity_rhs_dde",                (DL_FUNC) &adaptive_capacity_rhs_dde,                1},
    {"adaptive_capacity_rhs_desolve",            (DL_FUNC) &adaptive_capacity_rhs_desolve,            1},
    {"brander_taylor_initmod_desolve",           (DL_FUNC) &brander_taylor_initmod_desolve,           1},
    {"brander_taylor_rhs_dde",                   (DL_FUNC) &brander_taylor_rhs_dde,                   1},
    {"brander_taylor_rhs_desolve",               (DL_FUNC) &brander_taylor_rhs_desolve,               1},
    {"elite_extraction_initmod_desolve",         (DL_FUNC) &elite_extraction_initmod_desolve,         1},
    {"elite_extraction_rhs_dde",                 (DL_FUNC) &elite_extraction_rhs_dde,                 1},
    {"elite_extraction_rhs_desolve",             (DL_FUNC) &elite_extraction_rhs_desolve,             1},
    {"fiscal_demographic_class_initmod_desolve", (DL_FUNC) &fiscal_demographic_class_initmod_desolve, 1},
    {"fiscal_demographic_class_rhs_dde",         (DL_FUNC) &fiscal_demographic_class_rhs_dde,         1},
    {"fiscal_demographic_class_rhs_desolve",     (DL_FUNC) &fiscal_demographic_class_rhs_desolve,     1},
    {"fiscal_demographic_initmod_desolve",       (DL_FUNC) &fiscal_demographic_initmod_desolve,       1},
    {"fiscal_demographic_rhs_dde",               (DL_FUNC) &fiscal_demographic_rhs_dde,               1},
    {"fiscal_demographic_rhs_desolve",           (DL_FUNC) &fiscal_demographic_rhs_desolve,           1},
    {"fiscal_demographic_war_initmod_desolve",   (DL_FUNC) &fiscal_demographic_war_initmod_desolve,   1},
    {"fiscal_demographic_war_rhs_dde",           (DL_FUNC) &fiscal_demographic_war_rhs_dde,           1},
    {"fiscal_demographic_war_rhs_desolve",       (DL_FUNC) &fiscal_demographic_war_rhs_desolve,       1},
    {"janssen_rhs_dde",                          (DL_FUNC) &janssen_rhs_dde,                          1},
    {"janssen_stochastic_rhs_dde",               (DL_FUNC) &janssen_stochastic_rhs_dde,               1},
    {"nefedov_initmod_desolve",                  (DL_FUNC) &nefedov_initmod_desolve,                  1},
    {"nefedov_rhs_dde",                          (DL_FUNC) &nefedov_rhs_dde,                          1},
    {"nefedov_rhs_desolve",                      (DL_FUNC) &nefedov_rhs_desolve,                      1},
    {"scaling_cities_initmod_desolve",           (DL_FUNC) &scaling_cities_initmod_desolve,           1},
    {"scaling_cities_rhs_dde",                   (DL_FUNC) &scaling_cities_rhs_dde,                   1},
    {"scaling_cities_rhs_desolve",               (DL_FUNC) &scaling_cities_rhs_desolve,               1},
    {"stateless_war_initmod_desolve",            (DL_FUNC) &stateless_war_initmod_desolve,            1},
    {"stateless_war_rhs_dde",                    (DL_FUNC) &stateless_war_rhs_dde,                    1},
    {"stateless_war_rhs_desolve",                (DL_FUNC) &stateless_war_rhs_desolve,                1},
    {NULL, NULL, 0}
};

static const R_CallMethodDef CallEntries[] = {
    {"adaptive_capacity_contents",                  (DL_FUNC) &adaptive_capacity_contents,                  1},
    {"adaptive_capacity_create",                    (DL_FUNC) &adaptive_capacity_create,                    1},
    {"adaptive_capacity_initial_conditions",        (DL_FUNC) &adaptive_capacity_initial_conditions,        2},
    {"adaptive_capacity_metadata",                  (DL_FUNC) &adaptive_capacity_metadata,                  1},
    {"adaptive_capacity_rhs_r",                     (DL_FUNC) &adaptive_capacity_rhs_r,                     3},
    {"adaptive_capacity_set_initial",               (DL_FUNC) &adaptive_capacity_set_initial,               4},
    {"adaptive_capacity_set_user",                  (DL_FUNC) &adaptive_capacity_set_user,                  2},
    {"brander_taylor_contents",                     (DL_FUNC) &brander_taylor_contents,                     1},
    {"brander_taylor_create",                       (DL_FUNC) &brander_taylor_create,                       1},
    {"brander_taylor_initial_conditions",           (DL_FUNC) &brander_taylor_initial_conditions,           2},
    {"brander_taylor_metadata",                     (DL_FUNC) &brander_taylor_metadata,                     1},
    {"brander_taylor_rhs_r",                        (DL_FUNC) &brander_taylor_rhs_r,                        3},
    {"brander_taylor_set_initial",                  (DL_FUNC) &brander_taylor_set_initial,                  4},
    {"brander_taylor_set_user",                     (DL_FUNC) &brander_taylor_set_user,                     2},
    {"elite_extraction_contents",                   (DL_FUNC) &elite_extraction_contents,                   1},
    {"elite_extraction_create",                     (DL_FUNC) &elite_extraction_create,                     1},
    {"elite_extraction_initial_conditions",         (DL_FUNC) &elite_extraction_initial_conditions,         2},
    {"elite_extraction_metadata",                   (DL_FUNC) &elite_extraction_metadata,                   1},
    {"elite_extraction_rhs_r",                      (DL_FUNC) &elite_extraction_rhs_r,                      3},
    {"elite_extraction_set_initial",                (DL_FUNC) &elite_extraction_set_initial,                4},
    {"elite_extraction_set_user",                   (DL_FUNC) &elite_extraction_set_user,                   2},
    {"fiscal_demographic_class_contents",           (DL_FUNC) &fiscal_demographic_class_contents,           1},
    {"fiscal_demographic_class_create",             (DL_FUNC) &fiscal_demographic_class_create,             1},
    {"fiscal_demographic_class_initial_conditions", (DL_FUNC) &fiscal_demographic_class_initial_conditions, 2},
    {"fiscal_demographic_class_metadata",           (DL_FUNC) &fiscal_demographic_class_metadata,           1},
    {"fiscal_demographic_class_rhs_r",              (DL_FUNC) &fiscal_demographic_class_rhs_r,              3},
    {"fiscal_demographic_class_set_initial",        (DL_FUNC) &fiscal_demographic_class_set_initial,        4},
    {"fiscal_demographic_class_set_user",           (DL_FUNC) &fiscal_demographic_class_set_user,           2},
    {"fiscal_demographic_contents",                 (DL_FUNC) &fiscal_demographic_contents,                 1},
    {"fiscal_demographic_create",                   (DL_FUNC) &fiscal_demographic_create,                   1},
    {"fiscal_demographic_initial_conditions",       (DL_FUNC) &fiscal_demographic_initial_conditions,       2},
    {"fiscal_demographic_metadata",                 (DL_FUNC) &fiscal_demographic_metadata,                 1},
    {"fiscal_demographic_rhs_r",                    (DL_FUNC) &fiscal_demographic_rhs_r,                    3},
    {"fiscal_demographic_set_initial",              (DL_FUNC) &fiscal_demographic_set_initial,              4},
    {"fiscal_demographic_set_user",                 (DL_FUNC) &fiscal_demographic_set_user,                 2},
    {"fiscal_demographic_war_contents",             (DL_FUNC) &fiscal_demographic_war_contents,             1},
    {"fiscal_demographic_war_create",               (DL_FUNC) &fiscal_demographic_war_create,               1},
    {"fiscal_demographic_war_initial_conditions",   (DL_FUNC) &fiscal_demographic_war_initial_conditions,   2},
    {"fiscal_demographic_war_metadata",             (DL_FUNC) &fiscal_demographic_war_metadata,             1},
    {"fiscal_demographic_war_rhs_r",                (DL_FUNC) &fiscal_demographic_war_rhs_r,                3},
    {"fiscal_demographic_war_set_initial",          (DL_FUNC) &fiscal_demographic_war_set_initial,          4},
    {"fiscal_demographic_war_set_user",             (DL_FUNC) &fiscal_demographic_war_set_user,             2},
    {"janssen_contents",                            (DL_FUNC) &janssen_contents,                            1},
    {"janssen_create",                              (DL_FUNC) &janssen_create,                              1},
    {"janssen_initial_conditions",                  (DL_FUNC) &janssen_initial_conditions,                  2},
    {"janssen_metadata",                            (DL_FUNC) &janssen_metadata,                            1},
    {"janssen_rhs_r",                               (DL_FUNC) &janssen_rhs_r,                               3},
    {"janssen_set_initial",                         (DL_FUNC) &janssen_set_initial,                         4},
    {"janssen_set_user",                            (DL_FUNC) &janssen_set_user,                            2},
    {"janssen_stochastic_contents",                 (DL_FUNC) &janssen_stochastic_contents,                 1},
    {"janssen_stochastic_create",                   (DL_FUNC) &janssen_stochastic_create,                   1},
    {"janssen_stochastic_initial_conditions",       (DL_FUNC) &janssen_stochastic_initial_conditions,       2},
    {"janssen_stochastic_metadata",                 (DL_FUNC) &janssen_stochastic_metadata,                 1},
    {"janssen_stochastic_rhs_r",                    (DL_FUNC) &janssen_stochastic_rhs_r,                    3},
    {"janssen_stochastic_set_initial",              (DL_FUNC) &janssen_stochastic_set_initial,              4},
    {"janssen_stochastic_set_user",                 (DL_FUNC) &janssen_stochastic_set_user,                 2},
    {"nefedov_contents",                            (DL_FUNC) &nefedov_contents,                            1},
    {"nefedov_create",                              (DL_FUNC) &nefedov_create,                              1},
    {"nefedov_initial_conditions",                  (DL_FUNC) &nefedov_initial_conditions,                  2},
    {"nefedov_metadata",                            (DL_FUNC) &nefedov_metadata,                            1},
    {"nefedov_rhs_r",                               (DL_FUNC) &nefedov_rhs_r,                               3},
    {"nefedov_set_initial",                         (DL_FUNC) &nefedov_set_initial,                         4},
    {"nefedov_set_user",                            (DL_FUNC) &nefedov_set_user,                            2},
    {"scaling_cities_contents",                     (DL_FUNC) &scaling_cities_contents,                     1},
    {"scaling_cities_create",                       (DL_FUNC) &scaling_cities_create,                       1},
    {"scaling_cities_initial_conditions",           (DL_FUNC) &scaling_cities_initial_conditions,           2},
    {"scaling_cities_metadata",                     (DL_FUNC) &scaling_cities_metadata,                     1},
    {"scaling_cities_rhs_r",                        (DL_FUNC) &scaling_cities_rhs_r,                        3},
    {"scaling_cities_set_initial",                  (DL_FUNC) &scaling_cities_set_initial,                  4},
    {"scaling_cities_set_user",                     (DL_FUNC) &scaling_cities_set_user,                     2},
    {"stateless_war_contents",                      (DL_FUNC) &stateless_war_contents,                      1},
    {"stateless_war_create",                        (DL_FUNC) &stateless_war_create,                        1},
    {"stateless_war_initial_conditions",            (DL_FUNC) &stateless_war_initial_conditions,            2},
    {"stateless_war_metadata",                      (DL_FUNC) &stateless_war_metadata,                      1},
    {"stateless_war_rhs_r",                         (DL_FUNC) &stateless_war_rhs_r,                         3},
    {"stateless_war_set_initial",                   (DL_FUNC) &stateless_war_set_initial,                   4},
    {"stateless_war_set_user",                      (DL_FUNC) &stateless_war_set_user,                      2},
    {NULL, NULL, 0}
};

void R_init_malthus(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
