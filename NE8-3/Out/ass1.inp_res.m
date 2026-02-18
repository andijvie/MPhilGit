
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1: 14])  = 'Serpent 2.1.31' ;
COMPILE_DATE              (idx, [1: 20])  = 'Oct 23 2021 12:26:58' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1: 13])  = 'UO2 PIN MODEL' ;
CONFIDENTIAL_DATA         (idx, 1)        = 0 ;
INPUT_FILE_NAME           (idx, [1:  8])  = 'ass1.inp' ;
WORKING_DIRECTORY         (idx, [1: 24])  = '/home/aqz22/serpent_test' ;
HOSTNAME                  (idx, [1: 17])  = 'ray.eng.cam.ac.uk' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2650 v2 @ 2.60GHz' ;
CPU_MHZ                   (idx, 1)        = 1070.0 ;
START_DATE                (idx, [1: 24])  = 'Tue Feb 17 23:37:17 2026' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Tue Feb 17 23:39:57 2026' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 1000 ;
SKIP                      (idx, 1)        = 100 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1771371437343 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 1 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ];
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;

CRIT_SPEC_MODE            (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 1 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 4 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 1 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 1 ;
DOUBLE_INDEXING           (idx, 1)        = 0 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 25 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
OMP_HISTORY_PROFILE       (idx, [1:  25]) = [  1.37277E+00  9.74027E-01  9.54076E-01  9.78225E-01  9.44165E-01  9.69654E-01  9.92987E-01  9.91830E-01  9.87137E-01  9.60846E-01  9.90992E-01  9.88248E-01  1.04505E+00  1.02296E+00  1.00800E+00  9.79181E-01  9.69292E-01  9.96190E-01  9.85801E-01  9.86937E-01  9.68007E-01  9.59672E-01  9.59367E-01  9.54758E-01  1.05983E+00  ];
SHARE_BUF_ARRAY           (idx, 1)        = 0 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;
OMP_SHARED_QUEUE_LIM      (idx, 1)        = 0 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 62])  = '/usr/software/mcnplib/SERPENT/XSdata_endfb7/sss_endfb7u.xsdata' ;
DECAY_DATA_FILE_PATH      (idx, [1:  3])  = 'N/A' ;
SFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 5.8E-09  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  5.52806E-03 0.00073  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.94472E-01 4.1E-06  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  8.94680E-01 2.5E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  8.94924E-01 2.5E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.55997E+00 0.00014  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  5.53492E+01 0.00025  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  5.53492E+01 0.00025  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  6.49864E+00 0.00026  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  1.99727E-01 0.00091  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 1000 ;
SIMULATED_HISTORIES       (idx, 1)        = 10000809 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00008E+04 0.00040 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00008E+04 0.00040 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  3.99991E+01 ;
RUNNING_TIME              (idx, 1)        =  2.67638E+00 ;
INIT_TIME                 (idx, [1:  2])  = [  1.96667E-02  1.96667E-02 ];
PROCESS_TIME              (idx, [1:  2])  = [  6.66666E-04  6.66666E-04 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  2.65605E+00  2.65605E+00  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  2.67567E+00  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 14.94520 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.51020E+01 0.00075 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.32683E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 40155.61 ;
ALLOC_MEMSIZE             (idx, 1)        = 518.12;
MEMSIZE                   (idx, 1)        = 284.54;
XS_MEMSIZE                (idx, 1)        = 91.44;
MAT_MEMSIZE               (idx, 1)        = 20.01;
RES_MEMSIZE               (idx, 1)        = 5.69;
IFC_MEMSIZE               (idx, 1)        = 0.00;
MISC_MEMSIZE              (idx, 1)        = 167.41;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 233.58;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 2 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 89994 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 3 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 7 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 7 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 162 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 0 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        =  0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  0.00000E+00 ;
INHALATION_TOXICITY       (idx, 1)        =  0.00000E+00 ;
INGESTION_TOXICITY        (idx, 1)        =  0.00000E+00 ;
ACTINIDE_INH_TOX          (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ING_TOX          (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_INH_TOX   (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ING_TOX   (idx, 1)        =  0.00000E+00 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
CS137_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
PHOTON_DECAY_SOURCE       (idx, 1)        =  0.00000E+00 ;
NEUTRON_DECAY_SOURCE      (idx, 1)        =  0.00000E+00 ;
ALPHA_DECAY_SOURCE        (idx, 1)        =  0.00000E+00 ;
ELECTRON_DECAY_SOURCE     (idx, 1)        =  0.00000E+00 ;

% Normalization coefficient:

NORM_COEF                 (idx, [1:   4]) = [  1.34897E+09 0.00029  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  2.22561E-01 0.00088 ];
U235_FISS                 (idx, [1:   4]) = [  7.43439E+12 0.00033  9.76459E-01 6.6E-05 ];
U238_FISS                 (idx, [1:   4]) = [  1.79255E+11 0.00279  2.35412E-02 0.00273 ];
U235_CAPT                 (idx, [1:   4]) = [  1.40112E+12 0.00095  2.38027E-01 0.00085 ];
U238_CAPT                 (idx, [1:   4]) = [  1.96632E+12 0.00083  3.34038E-01 0.00067 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS    (idx, [1:  2])  = [ 10000809 1.00000E+07 ];
BALA_SRC_NEUTRON_NXN     (idx, [1:  2])  = [ 0 7.77594E+03 ];
BALA_SRC_NEUTRON_VR      (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT     (idx, [1:  2])  = [ 10000809 1.00078E+07 ];

BALA_LOSS_NEUTRON_CAPT    (idx, [1:  2])  = [ 4360512 4.36363E+06 ];
BALA_LOSS_NEUTRON_FISS    (idx, [1:  2])  = [ 5640297 5.64414E+06 ];
BALA_LOSS_NEUTRON_LEAK    (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_CUT     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_ERR     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT     (idx, [1:  2])  = [ 10000809 1.00078E+07 ];

BALA_NEUTRON_DIFF         (idx, [1:  2])  = [ 0 -8.19564E-08 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.46929E+02 7.0E-09 ];
TOT_POWDENS               (idx, [1:   2]) = [  3.80000E-02 4.3E-09 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.86274E+13 4.0E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.61536E+12 4.4E-07 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  5.88708E+12 0.00021 ];
TOT_ABSRATE               (idx, [1:   2]) = [  1.35024E+13 9.0E-05 ];
TOT_SRCRATE               (idx, [1:   2]) = [  1.34897E+13 0.00029 ];
TOT_FLUX                  (idx, [1:   2]) = [  7.47997E+14 0.00024 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  1.35024E+13 9.0E-05 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  7.47184E+14 0.00024 ];
INI_FMASS                 (idx, 1)        =  6.49813E-03 ;
TOT_FMASS                 (idx, 1)        =  6.49813E-03 ;

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  1.85715E+00 0.00021 ];
SIX_FF_F                  (idx, [1:   2]) = [  7.95907E-01 0.00017 ];
SIX_FF_P                  (idx, [1:   2]) = [  8.63393E-01 0.00013 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.08183E+00 0.00012 ];
SIX_FF_LF                 (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
SIX_FF_LT                 (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
SIX_FF_KINF               (idx, [1:   2]) = [  1.38060E+00 0.00026 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  1.38060E+00 0.00026 ];

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.44603E+00 4.3E-06 ];
FISSE                     (idx, [1:   2]) = [  2.02382E+02 4.4E-07 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  1.38062E+00 0.00028  1.37133E+00 0.00027  9.26570E-03 0.00506 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.38062E+00 9.0E-05 ];
COL_KEFF                  (idx, [1:   2]) = [  1.38097E+00 0.00029 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.38062E+00 9.0E-05 ];
ABS_KINF                  (idx, [1:   2]) = [  1.38062E+00 9.0E-05 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.88470E+01 7.3E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.88478E+01 2.8E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  1.30704E-07 0.00138 ];
IMP_EALF                  (idx, [1:   2]) = [  1.30493E-07 0.00053 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  8.27832E-02 0.00291 ];
IMP_AFGE                  (idx, [1:   2]) = [  8.24154E-02 0.00101 ];

% Forward-weighted delayed neutron parameters:

PRECURSOR_GROUPS          (idx, 1)        = 6 ;
FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  4.91204E-03 0.00401  1.56636E-04 0.02153  8.09041E-04 0.00966  7.74474E-04 0.00958  2.25436E-03 0.00584  6.80788E-04 0.01052  2.36744E-04 0.01679 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  7.78638E-01 0.00885  1.09168E-02 0.01201  3.17542E-02 0.00010  1.09702E-01 0.00013  3.18436E-01 0.00011  1.35015E+00 8.9E-05  8.50554E+00 0.00533 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  6.74629E-03 0.00522  2.16680E-04 0.02813  1.09437E-03 0.01296  1.06560E-03 0.01330  3.10299E-03 0.00779  9.38647E-04 0.01413  3.27998E-04 0.02287 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  7.85204E-01 0.01209  1.24906E-02 1.1E-06  3.17539E-02 0.00013  1.09708E-01 0.00017  3.18440E-01 0.00014  1.35025E+00 0.00011  8.73480E+00 0.00092 ];

% Adjoint weighted time constants using Nauchi's method:

IFP_CHAIN_LENGTH          (idx, 1)        = 15 ;
ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  4.86344E-05 0.00060  4.86299E-05 0.00061  4.93191E-05 0.00645 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  6.71408E-05 0.00054  6.71344E-05 0.00055  6.80914E-05 0.00645 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  6.71298E-03 0.00512  2.22197E-04 0.02861  1.09715E-03 0.01310  1.05307E-03 0.01318  3.08221E-03 0.00771  9.30799E-04 0.01418  3.27565E-04 0.02224 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  7.86097E-01 0.01196  1.24906E-02 1.4E-06  3.17533E-02 0.00014  1.09707E-01 0.00020  3.18397E-01 0.00014  1.35012E+00 0.00013  8.73891E+00 0.00108 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  4.86183E-05 0.00134  4.86100E-05 0.00134  4.96627E-05 0.01436 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  6.71168E-05 0.00129  6.71053E-05 0.00130  6.85545E-05 0.01435 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  6.77935E-03 0.01455  2.30309E-04 0.08054  1.14674E-03 0.03504  1.01867E-03 0.03821  3.08713E-03 0.02167  9.61799E-04 0.03864  3.34705E-04 0.06486 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  7.85363E-01 0.03511  1.24906E-02 2.3E-06  3.17610E-02 0.00031  1.09720E-01 0.00044  3.18419E-01 0.00042  1.35030E+00 0.00028  8.72737E+00 0.00206 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  6.77659E-03 0.01418  2.23612E-04 0.07821  1.14926E-03 0.03435  1.02359E-03 0.03704  3.08526E-03 0.02120  9.54933E-04 0.03729  3.39940E-04 0.06267 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  7.91981E-01 0.03406  1.24906E-02 2.2E-06  3.17590E-02 0.00031  1.09717E-01 0.00044  3.18444E-01 0.00042  1.35035E+00 0.00028  8.72671E+00 0.00205 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -1.39697E+02 0.01465 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  4.86553E-05 0.00040 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  6.71691E-05 0.00027 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  6.73505E-03 0.00275 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -1.38452E+02 0.00280 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.12569E-06 0.00022 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.36468E-06 0.00025  2.36470E-06 0.00025  2.36205E-06 0.00308 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  6.98068E-05 0.00034  6.98066E-05 0.00035  6.98476E-05 0.00420 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  8.63596E-01 0.00013  8.61865E-01 0.00013  1.23386E+00 0.00586 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.07021E+01 0.00893 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  5.53492E+01 0.00025  5.83614E+01 0.00031 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  7.97691E+04 0.00236  3.09685E+05 0.00121  6.10060E+05 0.00064  6.34333E+05 0.00044  5.45819E+05 0.00048  5.19176E+05 0.00044  3.56022E+05 0.00045  3.00478E+05 0.00051  2.31728E+05 0.00045  1.90347E+05 0.00050  1.65065E+05 0.00047  1.48601E+05 0.00047  1.38481E+05 0.00057  1.32117E+05 0.00045  1.29370E+05 0.00048  1.12271E+05 0.00050  1.11759E+05 0.00054  1.11092E+05 0.00063  1.09907E+05 0.00040  2.17662E+05 0.00037  2.14685E+05 0.00041  1.58682E+05 0.00038  1.04760E+05 0.00058  1.25114E+05 0.00061  1.22638E+05 0.00049  1.08936E+05 0.00048  1.95639E+05 0.00043  4.31196E+04 0.00085  5.40681E+04 0.00067  4.90684E+04 0.00081  2.86816E+04 0.00112  4.97501E+04 0.00074  3.39495E+04 0.00101  2.92350E+04 0.00103  5.65421E+03 0.00200  5.62081E+03 0.00176  5.72759E+03 0.00236  5.90856E+03 0.00213  5.85764E+03 0.00201  5.75892E+03 0.00211  5.95676E+03 0.00186  5.59920E+03 0.00264  1.05706E+04 0.00155  1.68749E+04 0.00155  2.15705E+04 0.00112  5.70515E+04 0.00085  6.15124E+04 0.00064  7.27913E+04 0.00063  5.67584E+04 0.00067  4.66237E+04 0.00085  3.77751E+04 0.00080  4.74471E+04 0.00095  9.76105E+04 0.00062  1.41645E+05 0.00050  2.91124E+05 0.00039  4.78002E+05 0.00037  7.51250E+05 0.00034  4.94402E+05 0.00034  3.59363E+05 0.00038  2.60634E+05 0.00042  2.35808E+05 0.00047  2.33606E+05 0.00041  1.96126E+05 0.00044  1.33332E+05 0.00051  1.23492E+05 0.00047  1.10412E+05 0.00045  9.38680E+04 0.00047  7.42292E+04 0.00052  5.01636E+04 0.00065  1.79794E+04 0.00093 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  1.38097E+00 0.00027 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  4.46795E+14 0.00028  3.01222E+14 0.00026 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  5.60321E-01 8.5E-05  1.64951E+00 5.2E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  2.92265E-03 0.00058  1.52099E-02 0.00011 ];
INF_ABS                   (idx, [1:   4]) = [  4.15181E-03 0.00045  3.86704E-02 0.00021 ];
INF_FISS                  (idx, [1:   4]) = [  1.22916E-03 0.00039  2.34605E-02 0.00028 ];
INF_NSF                   (idx, [1:   4]) = [  3.15407E-03 0.00039  5.71661E-02 0.00028 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.56605E+00 4.6E-05  2.43670E+00 3.3E-09 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03818E+02 4.7E-06  2.02270E+02 0.0E+00 ];
INF_INVV                  (idx, [1:   4]) = [  6.50412E-08 0.00022  2.69899E-06 4.9E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  5.56173E-01 8.6E-05  1.61084E+00 5.7E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.98255E-01 0.00011  4.29343E-01 0.00012 ];
INF_SCATT2                (idx, [1:   4]) = [  1.16181E-01 0.00017  9.91302E-02 0.00047 ];
INF_SCATT3                (idx, [1:   4]) = [  6.74843E-03 0.00255  2.96436E-02 0.00102 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.49655E-02 0.00101 -1.04730E-02 0.00269 ];
INF_SCATT5                (idx, [1:   4]) = [ -9.67673E-04 0.01493  7.52995E-03 0.00346 ];
INF_SCATT6                (idx, [1:   4]) = [  5.77054E-03 0.00218 -1.93772E-02 0.00117 ];
INF_SCATT7                (idx, [1:   4]) = [  7.90931E-04 0.01336  8.04751E-04 0.02807 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  5.56196E-01 8.6E-05  1.61084E+00 5.7E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.98256E-01 0.00011  4.29343E-01 0.00012 ];
INF_SCATTP2               (idx, [1:   4]) = [  1.16181E-01 0.00017  9.91302E-02 0.00047 ];
INF_SCATTP3               (idx, [1:   4]) = [  6.74843E-03 0.00255  2.96436E-02 0.00102 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.49654E-02 0.00101 -1.04730E-02 0.00269 ];
INF_SCATTP5               (idx, [1:   4]) = [ -9.67799E-04 0.01491  7.52995E-03 0.00346 ];
INF_SCATTP6               (idx, [1:   4]) = [  5.77047E-03 0.00218 -1.93772E-02 0.00117 ];
INF_SCATTP7               (idx, [1:   4]) = [  7.90778E-04 0.01338  8.04751E-04 0.02807 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  1.72797E-01 0.00022  1.05965E+00 8.3E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.92905E+00 0.00022  3.14571E-01 8.3E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  4.12833E-03 0.00045  3.86704E-02 0.00021 ];
INF_REMXS                 (idx, [1:   4]) = [  3.06056E-02 0.00013  3.92439E-02 0.00031 ];

% Poison cross sections:

INF_I135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_YIELD          (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MICRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

INF_CHIT                  (idx, [1:   4]) = [  1.00000E+00 9.8E-08  9.84555E-08 1.00000 ];
INF_CHIP                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHID                  (idx, [1:   4]) = [  9.99985E-01 1.5E-05  1.50951E-05 1.00000 ];

% Scattering matrixes:

INF_S0                    (idx, [1:   8]) = [  5.29715E-01 8.5E-05  2.64576E-02 0.00018  5.78237E-04 0.00267  1.61026E+00 5.7E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.90333E-01 0.00011  7.92256E-03 0.00044  3.18264E-04 0.00331  4.29025E-01 0.00012 ];
INF_S2                    (idx, [1:   8]) = [  1.18426E-01 0.00016 -2.24523E-03 0.00127  1.71556E-04 0.00425  9.89586E-02 0.00048 ];
INF_S3                    (idx, [1:   8]) = [  9.48908E-03 0.00177 -2.74065E-03 0.00099  5.99412E-05 0.00985  2.95837E-02 0.00102 ];
INF_S4                    (idx, [1:   8]) = [ -1.40236E-02 0.00105 -9.41843E-04 0.00314  4.19009E-07 1.00000 -1.04734E-02 0.00270 ];
INF_S5                    (idx, [1:   8]) = [ -9.77318E-04 0.01409  9.64476E-06 0.26291 -2.35025E-05 0.02310  7.55346E-03 0.00345 ];
INF_S6                    (idx, [1:   8]) = [  5.98298E-03 0.00214 -2.12434E-04 0.01197 -3.01642E-05 0.01592 -1.93470E-02 0.00117 ];
INF_S7                    (idx, [1:   8]) = [  1.04198E-03 0.00945 -2.51054E-04 0.00878 -2.75059E-05 0.01369  8.32257E-04 0.02712 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  5.29739E-01 8.5E-05  2.64576E-02 0.00018  5.78237E-04 0.00267  1.61026E+00 5.7E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.90333E-01 0.00011  7.92256E-03 0.00044  3.18264E-04 0.00331  4.29025E-01 0.00012 ];
INF_SP2                   (idx, [1:   8]) = [  1.18426E-01 0.00016 -2.24523E-03 0.00127  1.71556E-04 0.00425  9.89586E-02 0.00048 ];
INF_SP3                   (idx, [1:   8]) = [  9.48908E-03 0.00177 -2.74065E-03 0.00099  5.99412E-05 0.00985  2.95837E-02 0.00102 ];
INF_SP4                   (idx, [1:   8]) = [ -1.40235E-02 0.00105 -9.41843E-04 0.00314  4.19009E-07 1.00000 -1.04734E-02 0.00270 ];
INF_SP5                   (idx, [1:   8]) = [ -9.77443E-04 0.01408  9.64476E-06 0.26291 -2.35025E-05 0.02310  7.55346E-03 0.00345 ];
INF_SP6                   (idx, [1:   8]) = [  5.98291E-03 0.00214 -2.12434E-04 0.01197 -3.01642E-05 0.01592 -1.93470E-02 0.00117 ];
INF_SP7                   (idx, [1:   8]) = [  1.04183E-03 0.00946 -2.51054E-04 0.00878 -2.75059E-05 0.01369  8.32257E-04 0.02712 ];

% Micro-group spectrum:

B1_MICRO_FLX              (idx, [1: 140]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Integral parameters:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_KEFF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_B2                     (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_ERR                    (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Critical spectra in infinite geometry:

B1_FLX                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS_FLX               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

B1_TOT                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CAPT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABS                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NUBAR                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_KAPPA                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_INVV                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering cross sections:

B1_SCATT0                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT1                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT2                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT3                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT4                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT5                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT6                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT7                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering production cross sections:

B1_SCATTP0                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP1                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP2                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP3                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP4                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP5                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP6                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP7                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Diffusion parameters:

B1_TRANSPXS               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reduced absoption and removal:

B1_RABSXS                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison cross sections:

B1_I135_YIELD             (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_I135_MICRO_ABS         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

B1_CHIT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHIP                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHID                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

B1_S0                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S1                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S2                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S3                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S4                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S5                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S6                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S7                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering production matrixes:

B1_SP0                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP1                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP2                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP3                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP4                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP5                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP6                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP7                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Additional diffusion parameters:

CMM_TRANSPXS              (idx, [1:   4]) = [  1.92216E-01 0.00049  1.00278E+00 0.00092 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  1.91886E-01 0.00070  9.98661E-01 0.00170 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  1.91917E-01 0.00069  1.00600E+00 0.00191 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  1.92855E-01 0.00070  1.00408E+00 0.00183 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.73418E+00 0.00049  3.32422E-01 0.00092 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.73718E+00 0.00070  3.33828E-01 0.00171 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.73690E+00 0.00069  3.31404E-01 0.00191 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.72846E+00 0.00070  3.32034E-01 0.00184 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  6.74629E-03 0.00522  2.16680E-04 0.02813  1.09437E-03 0.01296  1.06560E-03 0.01330  3.10299E-03 0.00779  9.38647E-04 0.01413  3.27998E-04 0.02287 ];
LAMBDA                    (idx, [1:  14]) = [  7.85204E-01 0.01209  1.24906E-02 1.1E-06  3.17539E-02 0.00013  1.09708E-01 0.00017  3.18440E-01 0.00014  1.35025E+00 0.00011  8.73480E+00 0.00092 ];

