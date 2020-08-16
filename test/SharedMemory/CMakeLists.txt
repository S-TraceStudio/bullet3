
INCLUDE_DIRECTORIES(
	.
	../../src
	../gtest-1.7.0/include
	../../examples
	../../examples/ThirdPartyLibs
)


#ADD_DEFINITIONS(-DGTEST_HAS_PTHREAD=1)
ADD_DEFINITIONS(-DPHYSICS_LOOP_BACK -DPHYSICS_SERVER_DIRECT -DENABLE_GTEST -D_VARIADIC_MAX=10)

IF (USE_SOFT_BODY_MULTI_BODY_DYNAMICS_WORLD)
	LINK_LIBRARIES(BulletSoftBody)
ENDIF()

LINK_LIBRARIES(
 BulletInverseDynamicsUtils BulletInverseDynamics BulletFileLoader BulletWorldImporter Bullet3Common BulletDynamics BulletCollision LinearMath gtest BussIK
)

IF (NOT WIN32)
	LINK_LIBRARIES(		pthread	)
	IF (NOT APPLE)
		LINK_LIBRARIES(${DL})
	ENDIF()
ENDIF()

